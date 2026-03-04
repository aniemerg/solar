// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanupBool {
    function gggg(bool x) external pure returns (bool) {
        return x;
    }
    function f(uint256 a) external view returns (bool) {
        bool x = false;
        assembly { x := a }
        return this.gggg(x);
    }
}
