// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import { UUPSUpgradeable } from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import { ICreditLpToken } from "../interfaces/ICreditLpToken.sol";
import { CErc20 } from "../Compound/CErc20.sol";
import { ComptrollerInterface } from "../Compound/ComptrollerInterface.sol";
import { CTokenInterface } from "../Compound/CTokenInterfaces.sol";
import { InterestRateModel } from "../Compound/InterestRateModel.sol";
import { CreditVault } from "./CreditVault.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { PullModelPriceOracle } from "./PullModelPriceOracle.sol";

/// @title Storage for Credit LP token contract
/// @author Native
/// @notice Maintain the storage variables for Credit LP token contract
abstract contract CreditLpTokenStorage {
  /// @notice CreditVault address to check caller is CreditVault
  address public aquaVault;
  /// @notice The variable to record borrowing amount from swap and also offset the actual cash upon calculating exchange rate
  ///         Positive means the traders (RFQ providers) in total borrow out (short position) more from CreditVault than putting in (long position)
  ///         Negative means the traders (RFQ providers) in total putting in (long position) more from CreditVault than borrow out (short position)
  int public netSwapBorrow;
  /// @notice The variable to record the total reserve amount as protocol fee
  uint public swapBorrowReserve;

  /// @notice Storage slot reserved for upgradeability
  uint256[50] private __gap;
}

/// @title LP token contract for Credit
/// @author Native
/// @notice Inherit from Compound's CErc20 contract and override the functions to consider borrow amount from swap (positions)
contract CreditLpToken is CErc20, UUPSUpgradeable, CreditLpTokenStorage {
  using SafeERC20 for IERC20;

  error CallerNotAquaVault();
  error CallerNotAdmin();

  event AquaVaultSet(address newAquaVault);

  /// @notice Initialize the contract
  ///         copied from CToken.initialize() https://github.com/compound-finance/compound-protocol/blob/master/contracts/CToken.sol#L26
  ///         and CErc20.initialize() https://github.com/compound-finance/compound-protocol/blob/master/contracts/CErc20.sol#L16-L39
  /// @param underlying_ The address of the underlying token
  /// @param comptroller_ The address of the comptroller
  /// @param interestRateModel_ The address of the interest rate model
  /// @param initialExchangeRateMantissa_ The initial exchange rate mantissa
  /// @param name_ The name of the token
  /// @param symbol_ The symbol of the token
  /// @param decimals_ The decimals of the token
  function initialize(
    address underlying_,
    ComptrollerInterface comptroller_,
    InterestRateModel interestRateModel_,
    uint initialExchangeRateMantissa_,
    string memory name_,
    string memory symbol_,
    uint8 decimals_
  ) public initializer {
    __UUPSUpgradeable_init();
    admin = payable(msg.sender);
    aquaVault = address(comptroller_);

    // Set initial exchange rate
    initialExchangeRateMantissa = initialExchangeRateMantissa_;
    require(
      initialExchangeRateMantissa > 0,
      "initial exchange rate must be greater than zero."
    );

    // Set the comptroller
    uint err = _setComptroller(comptroller_);
    require(err == NO_ERROR, "setting comptroller failed");

    // Initialize block number and borrow index (block number mocks depend on comptroller being set)
    accrualBlockTimestamp = getBlockTimestamp();
    borrowIndex = mantissaOne;

    // Set the interest rate model (depends on block number / borrow index)
    err = _setInterestRateModelFresh(interestRateModel_);
    require(err == NO_ERROR, "setting interest rate model failed");

    name = name_;
    symbol = symbol_;
    decimals = decimals_;

    // The counter starts true to prevent changing it from zero to non-zero (i.e. smaller cost/refund)
    _notEntered = true;

    underlying = underlying_;
    IERC20(underlying).totalSupply();
  }

  /// @custom:oz-upgrades-unsafe-allow constructor
  constructor() {
    _disableInitializers();
  }

  function getImplementation() public view returns (address) {
    return _getImplementation();
  }

  function _authorizeUpgrade(
    address newImplementation
  ) internal view override onlyAdmin {
    CreditLpToken(newImplementation).isCToken();
  }

  modifier onlyAdmin() {
    if (msg.sender != admin) {
      revert CallerNotAdmin();
    }
    _;
  }

  modifier onlyAquaVault() {
    if (msg.sender != aquaVault) {
      revert CallerNotAquaVault();
    }
    _;
  }

  function setAquaVault(address newAquaVault) public onlyAdmin {
    aquaVault = newAquaVault;
    uint err = _setComptroller(ComptrollerInterface(newAquaVault));
    require(err == NO_ERROR, "setting comptroller failed");
    emit AquaVaultSet(newAquaVault);
  }

  /// @notice Update the borrow amount from swap
  ///         Called by CreditVault when
  ///         1. A trader (RFQ provider) power a swap
  ///            If the token is borrowed out to the swapper (short position), the borrow amount will be positive
  ///            If the token is put in by the swapepr (long position), the borrow amount will be negative
  ///         2. settle, liquidate, epochUpdate
  /// @param amount The amount to update
  function updateNetBorrow(int amount) external onlyAquaVault {
    netSwapBorrow += amount;
  }

  /// @notice Update the swap borrow reserve
  ///         Called by CreditVault on epochUpdate
  /// @param amount The amount to update
  function updateReserve(uint amount) external onlyAquaVault {
    totalReserves += amount;
  }

  /// @dev Override the exchange rate calculation to consider borrow amount from swap (netSwapBorrow)
  function exchangeRateStoredInternal() internal view override returns (uint) {
    uint _totalSupply = totalSupply;
    if (_totalSupply == 0) {
      /*
       * If there are no tokens minted:
       *  exchangeRate = initialExchangeRate
       */
      return initialExchangeRateMantissa;
    } else {
      /*
       * Otherwise:
       *  exchangeRate = (totalCash + totalBorrows - totalReserves - swapBorrowReserve + netSwapBorrow) / totalSupply
       */
      uint totalCash = getCashPrior();
      uint cashPlusBorrowsMinusReserves;
      if (netSwapBorrow >= 0) {
        cashPlusBorrowsMinusReserves =
          totalCash +
          totalBorrows +
          uint(netSwapBorrow) -
          totalReserves;
      } else {
        cashPlusBorrowsMinusReserves =
          totalCash +
          totalBorrows -
          uint(-netSwapBorrow) -
          totalReserves;
      }
      uint exchangeRate = (cashPlusBorrowsMinusReserves * expScale) /
        _totalSupply;

      return exchangeRate;
    }
  }

  /// @dev Override the balance calculation to read balance from CreditVault rather than from address(this)
  function getCashPrior() internal view override returns (uint) {
    return IERC20(underlying).balanceOf(aquaVault);
  }

  /// @dev Override the transferIn function to transfer underlying to CreditVault rather to address(this)
  /// @param from The address to transfer from
  /// @param amount The amount to transfer
  function doTransferIn(
    address from,
    uint amount
  ) internal override returns (uint) {
    // Read from storage once
    address underlying_ = underlying;
    IERC20 token = IERC20(underlying_);
    uint balanceBefore = token.balanceOf(aquaVault);
    token.safeTransferFrom(from, aquaVault, amount);

    // Calculate the amount that was *actually* transferred
    uint balanceAfter = token.balanceOf(aquaVault);
    return balanceAfter - balanceBefore; // underflow already checked above, just subtract
  }

  /// @dev override to transfer underlying from CreditVault rather than from address(this)
  /// @param to The address to transfer to
  /// @param amount The amount to transfer
  function doTransferOut(address payable to, uint amount) internal override {
    CreditVault(aquaVault).pay(to, amount);
  }

  /// @dev override to consider borrow amount from swap (netSwapBorrow) when calculating utilization rate and Compound borrow interest rate
  /// @dev accrue interest for Compound borrow but no change to netSwapBorrow
  function accrueInterest() public override returns (uint) {
    /* Remember the initial block number */
    uint currentBlockTimestamp = getBlockTimestamp();
    uint accrualBlockTimestampPrior = accrualBlockTimestamp;

    /* Short-circuit accumulating 0 interest */
    if (accrualBlockTimestampPrior == currentBlockTimestamp) {
      return NO_ERROR;
    }

    /* Read the previous values out of storage */
    uint cashPrior = getCashPrior();
    uint borrowsPrior = totalBorrows;
    uint reservesPrior = totalReserves;
    uint borrowIndexPrior = borrowIndex;

    uint directAndSwapBorrow = borrowsPrior;
    if (netSwapBorrow > 0) {
      directAndSwapBorrow += uint(netSwapBorrow);
    }

    /* Calculate the current borrow interest rate */
    uint borrowRateMantissa = interestRateModel.getBorrowRate(
      cashPrior,
      directAndSwapBorrow,
      reservesPrior
    );
    require(
      borrowRateMantissa <= borrowRateMaxMantissa,
      "borrow rate is absurdly high"
    );

    /* Calculate the number of timestamps elapsed since the last accrual */
    uint blockTimestampDelta = currentBlockTimestamp -
      accrualBlockTimestampPrior;

    /*
     * Calculate the interest accumulated into borrows and reserves and the new index:
     *  simpleInterestFactor = borrowRate * blockTimestampDelta
     *  interestAccumulated = simpleInterestFactor * totalBorrows
     *  totalBorrowsNew = interestAccumulated + totalBorrows
     *  totalReservesNew = interestAccumulated * reserveFactor + totalReserves
     *  borrowIndexNew = simpleInterestFactor * borrowIndex + borrowIndex
     */

    Exp memory simpleInterestFactor = mul_(
      Exp({ mantissa: borrowRateMantissa }),
      blockTimestampDelta
    );
    uint interestAccumulated = mul_ScalarTruncate(
      simpleInterestFactor,
      borrowsPrior
    );
    uint totalBorrowsNew = interestAccumulated + borrowsPrior;
    uint totalReservesNew = mul_ScalarTruncateAddUInt(
      Exp({ mantissa: reserveFactorMantissa }),
      interestAccumulated,
      reservesPrior
    );
    uint borrowIndexNew = mul_ScalarTruncateAddUInt(
      simpleInterestFactor,
      borrowIndexPrior,
      borrowIndexPrior
    );

    /////////////////////////
    // EFFECTS & INTERACTIONS
    // (No safe failures beyond this point)

    /* We write the previously calculated values into storage */
    accrualBlockTimestamp = currentBlockTimestamp;
    borrowIndex = borrowIndexNew;
    totalBorrows = totalBorrowsNew;
    totalReserves = totalReservesNew;

    /* We emit an AccrueInterest event */
    emit AccrueInterest(
      cashPrior,
      interestAccumulated,
      borrowIndexNew,
      totalBorrowsNew
    );

    return NO_ERROR;
  }

  /// @dev Override to consider borrow amount from swap (netSwapBorrow). When netSwapBorrow is positive, consider the utilization rate higher.
  /// @dev Not considering netSwapBorrow for negative value (more long postions than short) as it could become negative utilization rate
  function borrowRatePerTimestamp() external view override returns (uint) {
    uint directAndSwapBorrow = totalBorrows;
    if (netSwapBorrow > 0) {
      directAndSwapBorrow += uint(netSwapBorrow);
    }

    return
      interestRateModel.getBorrowRate(
        getCashPrior(),
        directAndSwapBorrow,
        totalReserves
      );
  }

  /// @dev Override to consider borrow amount from swap (netSwapBorrow). When netSwapBorrow is positive, consider the supply rate higher.
  /// @dev Not considering netSwapBorrow for negative value (more long postions than short) as it could become negative supply rate
  function supplyRatePerTimestamp() external view override returns (uint) {
    uint directAndSwapBorrow = totalBorrows;
    if (netSwapBorrow > 0) {
      directAndSwapBorrow += uint(netSwapBorrow);
    }

    return
      interestRateModel.getSupplyRate(
        getCashPrior(),
        directAndSwapBorrow,
        totalReserves,
        reserveFactorMantissa
      );
  }

  /// @dev For push oracle model, call the oracle to update prices. The params depends on the oracle implementation
  /// @param tokens The array of token addresses
  /// @param priceIds The array of price ids
  /// @param data The array of data used by the oracle
  function updatePrices(
    address[] calldata tokens,
    bytes32[] calldata priceIds,
    bytes[] calldata data
  ) public payable {
    PullModelPriceOracle(address(CreditVault(aquaVault).oracle())).updatePrices{
      value: msg.value
    }(tokens, priceIds, data, msg.sender);
  }

  /// @dev Zipped function to update prices and borrow. Frontend should check if the price is stale.
  ///      If price is not stale, call borrow directly, else call this function
  /// @param borrowAmount The amount to borrow
  /// @param tokens The array of token addresses
  /// @param priceIds The array of price ids
  /// @param data The array of data used by the oracle
  function updatePricesAndBorrow(
    uint borrowAmount,
    address[] calldata tokens,
    bytes32[] calldata priceIds,
    bytes[] calldata data
  ) public payable returns (uint) {
    updatePrices(tokens, priceIds, data);
    borrowInternal(borrowAmount);
    return NO_ERROR;
  }

  /// @dev Zipped function to update prices and redeem. Frontend should check if the price is stale.
  ///      If price is not stale, call redeem directly, else call this function
  /// @param redeemTokens The number of cTokens to redeem into underlying
  /// @param tokens The array of token addresses
  /// @param priceIds The array of price ids
  /// @param data The array of data used by the oracle
  function updatePricesAndRedeem(
    uint redeemTokens,
    address[] calldata tokens,
    bytes32[] calldata priceIds,
    bytes[] calldata data
  ) public payable returns (uint) {
    updatePrices(tokens, priceIds, data);
    redeemInternal(redeemTokens);
    return NO_ERROR;
  }

  /// @dev Zipped function to update prices and redeemUnderlying. Frontend should check if the price is stale.
  ///      If price is not stale, call redeemUnderlying directly, else call this function
  /// @param redeemAmount The amount of underlying to redeem
  /// @param tokens The array of token addresses
  /// @param priceIds The array of price ids
  /// @param data The array of data used by the oracle
  function updatePricesAndRedeemUnderlying(
    uint redeemAmount,
    address[] calldata tokens,
    bytes32[] calldata priceIds,
    bytes[] calldata data
  ) public payable returns (uint) {
    updatePrices(tokens, priceIds, data);
    redeemUnderlyingInternal(redeemAmount);
    return NO_ERROR;
  }

  /// @dev Zipped function to update prices and liquidateBorrow. Frontend should check if the price is stale.
  ///      If price is not stale, call liquidateBorrow directly, else call this function
  /// @param borrower The borrower of this cToken to be liquidated
  /// @param repayAmount The amount of the underlying borrowed asset to repay
  /// @param cTokenCollateral The market in which to seize collateral from the borrower
  /// @param tokens The array of token addresses
  /// @param priceIds The array of price ids
  /// @param data The array of data used by the oracle
  function updatePricesAndLiquidateBorrow(
    address borrower,
    uint repayAmount,
    CTokenInterface cTokenCollateral,
    address[] calldata tokens,
    bytes32[] calldata priceIds,
    bytes[] calldata data
  ) public payable returns (uint) {
    updatePrices(tokens, priceIds, data);
    liquidateBorrowInternal(
      borrower,
      repayAmount,
      CTokenInterface(cTokenCollateral)
    );
    return NO_ERROR;
  }

  /**
   * @notice Overriding the Compound's _reduceReservesFresh function open another role to withdraw reserves
   * @dev Requires fresh interest accrual
   * @param reduceAmount Amount of reduction to reserves
   * @return uint 0=success, otherwise a failure (see ErrorReporter.sol for details)
   */
  function _reduceReservesFresh(
    uint reduceAmount
  ) internal override returns (uint) {
    // totalReserves - reduceAmount
    uint totalReservesNew;

    address payable withdrawer = CreditVault(aquaVault)
      .lpTokenReserveWithdrawer();

    // Check caller is withdrawer or admin
    if (msg.sender != withdrawer && msg.sender != admin) {
      revert ReduceReservesWithdrawerCheck();
    }

    // We fail gracefully unless market's block number equals current block number
    if (accrualBlockTimestamp != getBlockTimestamp()) {
      revert ReduceReservesFreshCheck();
    }

    // Fail gracefully if protocol has insufficient underlying cash
    if (getCashPrior() < reduceAmount) {
      revert ReduceReservesCashNotAvailable();
    }

    // Check reduceAmount ≤ reserves[n] (totalReserves)
    if (reduceAmount > totalReserves) {
      revert ReduceReservesCashValidation();
    }

    /////////////////////////
    // EFFECTS & INTERACTIONS
    // (No safe failures beyond this point)

    totalReservesNew = totalReserves - reduceAmount;

    // Store reserves[n+1] = reserves[n] - reduceAmount
    totalReserves = totalReservesNew;

    // doTransferOut reverts if anything goes wrong, since we can't be sure if side effects occurred.
    doTransferOut(withdrawer, reduceAmount);

    emit ReservesReduced(withdrawer, reduceAmount, totalReservesNew);

    return NO_ERROR;
  }

  function withdrawAllReserve() external nonReentrant returns (uint) {
    accrueInterest();
    return _reduceReservesFresh(totalReserves);
  }
}
