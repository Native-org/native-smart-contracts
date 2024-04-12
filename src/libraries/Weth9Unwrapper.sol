// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import "../interfaces/IWETH9.sol";
import "./TransferHelper.sol";

contract Weth9Unwrapper {
    address public immutable weth9;
    address public immutable nativeRouter;

    constructor(address _weth9, address _router) {
        weth9 = _weth9;
        nativeRouter = _router;
    }

    receive() external payable {}

    function unwrapWeth9(uint256 amount, address recipient) public {
        require(msg.sender == nativeRouter, "only NativeRouter can call this function");
        IWETH9(weth9).withdraw(amount);
        TransferHelper.safeTransferETH(recipient, amount);
    }
}
