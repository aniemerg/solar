// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArraysTooLarge {
    function f(uint a, uint[] calldata b, uint c) external pure returns (uint) {
        return 7;
    }
}
