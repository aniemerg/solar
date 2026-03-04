// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyInModifiers {
    modifier m {
        uint256 a = 1;
        assembly {
            a := 2
        }
        if (a != 2) revert();
        _;
    }

    function f() public m returns (bool) {
        return true;
    }

    modifier n {
        uint256 a = 1;
        assembly {
            a := 2
        }
        if (a != 2)
            _;
        revert();
    }

    function g() public n returns (bool) {
        // This statement should never execute.
        return true;
    }
}
