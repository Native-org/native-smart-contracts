// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

interface INativeLPRewards {
    /* ========== EVENTS ========== */
    event Staked(address indexed user, address indexed stakingToken, uint256 amount);
    event Withdrawn(address indexed user, address indexed stakingToken, uint256 amount);
    event RewardPaid(address indexed user, address indexed rewardToken, uint256 reward);
    event RewardAdded(address indexed stakingToken, address indexed rewardToken, uint256 reward, uint duration);
    event RewardsDurationUpdated(uint256 newDuration);
    event RewardsWalletUpdated(address newRewardsWallet);

    /* ========== ERRORS ========== */
    error StakingTokenNotListed(address stakingToken);
    error RewardTokenNotListed(address rewardToken);
    error StakingTokenAlreadyListed(address stakingToken);
    error RewardTokenAlreadyListed(address rewardToken);
    error InsufficientStakedBalance(address token, uint256 balance, uint256 inputAmount);
    error NotEnoughRewardAvailableFromRewardWallet(
        address stakingToken,
        address rewardToken,
        uint256 inputRewardAmount,
        address rewardsWallet,
        uint256 rewardsWalletAllowance,
        uint256 rewardsWalletBalance
    );
    error InvalidAddress(address inputAddr);
    error ExceedMaxRewardTokenLimit();
    error TransferFromAmountMismatch(uint balanceBefore, uint balanceAfter, uint amount);

    /* ========== VIEWS ========== */
    function lastTimeRewardApplicable(address stakingToken, address rewardToken) external view returns (uint256);

    function rewardPerToken(address stakingToken, address rewardToken) external view returns (uint256);

    function earned(address account, address stakingToken, address rewardToken) external view returns (uint256);

    function getStakingTokensCount() external view returns (uint256);

    function getStakingTokenAtIndex(uint256 index) external view returns (address);

    function getRewardTokensCount() external view returns (uint256);

    function getRewardTokenAtIndex(uint256 index) external view returns (address);

    /* ========== MUTATIVE FUNCTIONS ========== */
    function stake(address stakingToken, uint256 amount) external;

    function withdraw(address stakingToken, uint256 amount) external;

    function batchClaimAllRewards(address[] calldata _stakingTokens) external;

    function batchExit(address[] calldata _stakingTokens) external;

    /* ========== RESTRICTED FUNCTIONS ========== */
    function addRewardTokens(address[] calldata rewardTokensAddresses) external;

    function addStakingTokens(address[] calldata stakingTokensAddresses) external;

    function notifyRewardAmount(
        address stakingToken,
        address rewardToken,
        uint256 reward,
        uint rewardsDuration
    ) external;

    function setRewardsWallet(address newRewardsWallet) external;
}
