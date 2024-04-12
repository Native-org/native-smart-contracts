# Native

## Overview
Native is an infratrusture that supports different kinds of pricing and liquidity models. For pricing models, Native supports both on-chain pricing (AMM) and off-chain pricing (professional market making, PMM). For liquidity source, Native supports private liquidity source (EOA), public liquidity source (liquidty pool contracts).

### Workflow
#### Pool Setup
1. Project owner deploys a `NativePool`, decide the pricing model, fee and other pool configs.
2. Project owner needs to provide liquidity support to the `NativePool` by giving allowance to the `NativePool` contract. It can either be project's own treasury EOA wallet, or can by smart contract. Native also provide a variety of liquidity pool contracts to support getting liquidity from community.
3. Each `NativePool` has a signer. Signer is a wallet to sign on the orders. Only signed order can be executed on Native pools. It's a mean to protect the treasury, especially for off-chain pricing. The signer is created and hosted by Native by default, but project owner can also run their own signer.
#### Swap
1. Trader will give allowance to `NativeRouter` and talk to Native off-chain API to get the signed order. (example for calling API can be found here: https://docs.native.org/native-dev/native-v1/guide)
2. Native off-chain router will check different liquidity sources, and decide the route by price, and return the signed order. For the hop using off-chain pricing (e.g. PMM pricing model), the off-chain router will get the qutoe from market maker and fill in the amountIn and amountOut in the order and sign it.
3. Native employ a feature of widget fee. Authorized partners can register the fee recipient with Native (off-chain). And they can charge a fee from the traders for using their swap widget. The widgetFee signer hosted by Native will sign the order to ensure the authenticity of fee recipient and fee rate.
4. With the signed order trader can call `NativeRouter` functions `exactInput`(for multi-hop) or `exactInputSingle`(for single hop) to exectue the transaction on-chain.
5. `NativeRouter` will decode the order and call `NativePool` for Native supported liquidity from projects, or other liquidity sources such as uniswap v3, 1inch, pancakeswap.

### Smart Contracts
#### Core Contracts
* `NativeRouter.sol`: Receive the order from trader with the 2 functions `exactInput` or `exactInputSingle`. Verify the order signature, process the widget fee and call corresponding liquidity source according to the order.
* `ExternalSwapRouterUpgradable.sol`: Implement the external liquidity source that `NativeRouter` could call. Including pancakeswap, uniswapV3 and 1inch.
* `PeripheryPayments.sol`: Include the logic for payment related to `NativeRouter` and also wrapping, unwrapping ETH.
* `NativePoolFactory.sol`: Deploy the new NativePool with the configurations using `createNewPool`
* `NativePool.sol`: Define the pairs it supports and pricing model it uses. `swap` is called by `NativeRouter`. Treasury (EOA wallet or smart contract) will need to give allowance to this contract to support the swap.

# Aqua

Aqua is a liquidity providing system for RFQ providers. It is built on top of the Compound model and existing Native RFQ system.
It consists of the following contracts

1. `AquaVault` contract holding user assets, serving as the treasury for a `NativePool` instance. It inherits `Comptroller` contract from Compound.
2. A list of LP token contracts `AquaLpToken` that allow liquidity providers to deposit asset to vault, mint LP token that earns the interest from borrowers and RFQ providers open positions fee. It inherits `CErc20`(which inherits `CToken` contract) contract from Compound.

## Architecture

![Aqua smart contract architecture](https://github-production-user-asset-6210df.s3.amazonaws.com/124560975/295851340-90291e8b-c08b-4688-b2b0-ed249ca6b848.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240412%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240412T040241Z&X-Amz-Expires=300&X-Amz-Signature=789e58b4829d3d9bc72878d844f30ac82ae717eb7232a754a13652e01e400a29&X-Amz-SignedHeaders=host&actor_id=23033847&key_id=0&repo_id=624225272)

## Workflow

### liquidity provider: mint, redeem, borrow, repay, liquidate

1. It has the exact functionalities as Compound
2. Liquidity providers interact with LP token contracts to mint, redeem, borrow and repay. The only difference here is that the underlying asset does not lie in LP token contracts, but in `AquaVault`
3. The interest accrual mechanism for liquidity provider operations are exactly identical as Compound.
4. When there's an unhealthy borrowing positions, liquidate function in `AquaVault` is open to anyone to repay the debt and claim the collateral.
5. Special Note: Besides major tokens, Aqua powers altcoin trading. For major tokens with reliable oracle prices, the LP token is exactly like Compound with full functionalities. For altcoins, liquidity providers can deposit asset and mint the LP token, the asset could be used by RFQ providers to fill the swap and LP can earn fee. But liquidity provider cannot borrow altcoins, and LP token of altcoins cannot serve as collateral to borrow other tokens.

### RFQ providers: trade

1. The RFQ provider's address would be added to the `NativePool` as a valid signer for RFQ.
2. When a swapper send swap request to Native off-chain API, Native checks with the RFQ providers for their quote and if they want to fill the order with Aqua liquidity. If so, they return the quote and signature. The signature would be verified in `NativePool`.
3. Native off-chain system verifies the quote and generate the signature for approving borrowing from Aqua. The signature would be verified in `AquaVault`.
4. Native API returns the quote and the 2 signatures (1 from RFQ provider, 1 from Native) to the swapper. And swapper calls `NativeRouter` to execute the trade.
5. `NativeRouter` process the calldata and calls `NativePool` for swapping. `NativePool` will verify the signature of the RFQ provider, and transfer the tokens from `AquaVault` to swapper, also send callback to `NativeRouter` to transfer tokens from swapper to `AquaVault`.
6. In the end, `NativePool` sends a callback to `AquaVault` to account the position change for the RFQ provider. Tokens transfer away from `AquaVault` to swapper would be short position and tokens transferred into `AquaVault` would be long position. All the live positions for the RFQ provider are recorded on-chain.
7. `AquaVault` calls the 2 LP tokens involved to update the varibale `netSwapBorrow`. For long postion, the borrow amount decreases (could be negative). For short position, it's the other way round. The update of the borrow amounts would cancel out the change of the actual asset. Thus the exchange rate wouldn't change before and after the trade.

### admin: epoch update

1. Native admin has the right to update the RFQ providers' open positions by the fees calculated off-chain.
2. After the update, the `netSwapBorrow` of each LP token contract should increase, and the exchange rate for LP token increases.

### RFQ providers: settle

1. RFQ provider can permissionlessly call `repay` function of `AquaVault` to close short positions. The contract transfers asset from RFQ provider to the vault and update the positions.
2. For settlement request that requires claiming long positions, RFQ provider needs to call Native API with the settlement proposal (how much of short positions to repay, how much of long positions to claim). Native off-chain system would validate the settlement proposal and returns singature.
3. RFQ provider calls `settle` function of `AquaVault` to execute the settlement.

### RFQ providers: collateral and liquidate

1. RFQ providers can put in collateral to get more borrowing credit. They mint LP tokens and calls `addCollateral` in `AquaVault` to stake the LP tokens to serve as collateral.
2. When RFQ providers want to remove collateral, they call Native off-chain API. Native system validate that the withdraw amount for RFQ providers doesn't make the open positions default and returns the signature. With the signature the collateral can be withdrawn.
3. A whitelist of liquidators can liquidate the RFQ provider's postions if it's unhealthy. It needs the Native off-chain API to do so.
