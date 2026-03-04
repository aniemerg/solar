// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function shl(uint256 a, uint256 b) public pure returns (uint256 c) {
        assembly {
            c := shl(b, a)
        }
    }

    function shr(uint256 a, uint256 b) public pure returns (uint256 c) {
        assembly {
            c := shr(b, a)
        }
    }

    function sar(uint256 a, uint256 b) public pure returns (uint256 c) {
        assembly {
            c := sar(b, a)
        }
    }
}
