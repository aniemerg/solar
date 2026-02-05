// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmptyForLoop {
    function f() public pure returns (uint256 ret) {
        ret = 1;
        for (;;) {
            ret += 1;
            if (ret >= 10) break;
        }
    }
}
