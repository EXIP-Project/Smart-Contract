// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";

contract TokenTimelockTest is TokenTimelock {
    constructor(
        IERC20 token_,
        address beneficiary_,
        uint256 releaseTime_
    ) TokenTimelock(token_, beneficiary_, releaseTime_) {}
}
