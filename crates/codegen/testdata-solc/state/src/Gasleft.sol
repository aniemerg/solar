// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Gasleft {
    function f() public view returns (bool) {
        return gasleft() > 0;
    }
}
