// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RevertBasics {
    uint256 public a = 42;

    function f() public {
        a = 1;
        revert();
    }

    function g() public {
        a = 1;
        assembly {
            revert(0, 0)
        }
    }
}
