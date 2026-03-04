// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function shl_zero(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := shl(0, a)
        }
    }

    function shr_zero(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := shr(0, a)
        }
    }

    function sar_zero(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := sar(0, a)
        }
    }

    function shl_large(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := shl(0x110, a)
        }
    }

    function shr_large(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := shr(0x110, a)
        }
    }

    function sar_large(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := sar(0x110, a)
        }
    }

    function shl_combined(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := shl(4, shl(12, a))
        }
    }

    function shr_combined(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := shr(4, shr(12, a))
        }
    }

    function sar_combined(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := sar(4, sar(12, a))
        }
    }

    function shl_combined_large(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := shl(0xd0, shl(0x40, a))
        }
    }

    function shl_combined_overflow(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := shl(0x01, shl(not(0x00), a))
        }
    }

    function shr_combined_large(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := shr(0xd0, shr(0x40, a))
        }
    }

    function shr_combined_overflow(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := shr(0x01, shr(not(0x00), a))
        }
    }

    function sar_combined_large(uint256 a) public pure returns (uint256 c) {
        assembly {
            c := sar(0xd0, sar(0x40, a))
        }
    }
}
