// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataAssignFromNowhere {
    function f() public pure returns (bytes calldata x) {
        assembly { x.offset := 0 x.length := 4 }
    }
}
