// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C99ScopingActivation {
    function f() public pure returns (uint256) {
        uint256 x = 7;
        {
            x = 3;
            uint256 x;
            x = 4;
        }
        return x;
    }

    function g() public pure returns (uint256 x) {
        x = 7;
        {
            x = 3;
            uint256 x;
            return x;
        }
    }

    function h() public pure returns (uint256 x, uint256 a, uint256 b) {
        x = 7;
        {
            x = 3;
            a = x;
            uint256 x = 4;
            b = x;
        }
    }

    function i() public pure returns (uint256 x, uint256 a) {
        x = 7;
        {
            x = 3;
            uint256 x = x;
            a = x;
        }
    }
}
