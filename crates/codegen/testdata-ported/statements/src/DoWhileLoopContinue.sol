// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DoWhileLoopContinue {
    function f() public pure returns (uint256 r) {
        uint256 i = 0;
        do {
            if (i > 0) return 0;
            i++;
            continue;
        } while (false);
        return 42;
    }
}
