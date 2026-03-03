// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;
pragma abicoder v2;

contract StorageBoundaryStructArrayPacked {
    struct S {
        uint64 a;
        uint64 b;
        uint64 c;
        uint64 d;
        // All fit in one slot (4 * 64 = 256 bits)
    }

    struct Canary {
        uint256 value;
    }

    function getBoundaryArray() internal pure returns (S[10][1] storage arr) {
        // 10 structs, each 1 slot = 10 slots total
        assembly {
            arr.slot := sub(0, 5)
        }
    }

    function getDest() internal pure returns (S[10][1] storage arr) {
        assembly {
            arr.slot := 6
        }
    }

    function getCanary() internal pure returns (Canary storage canary) {
        // Array ends at slot 4, canary at slot 5
        assembly {
            canary.slot := 5
        }
    }

    constructor() {
        Canary storage canary = getCanary();
        canary.value = type(uint256).max;
    }

    function fillBoundaryArray() public {
        S[10][1] storage arr = getBoundaryArray();
        for (uint i = 0; i < 10; i++) {
            arr[0][i] = S({
                a: uint64(1 + i * 4),
                b: uint64(2 + i * 4),
                c: uint64(3 + i * 4),
                d: uint64(4 + i * 4)
            });
        }
    }

    function deleteBoundaryArray() public {
        S[10][1] storage arr = getBoundaryArray();
        delete arr[0];
    }

    function copyFromBoundary() public {
        S[10][1] storage source = getBoundaryArray();
        S[10][1] storage dest = getDest();
        dest[0] = source[0];
    }

    function copyToBoundary() public {
        S[10][1] storage source = getDest();
        S[10][1] storage dest = getBoundaryArray();
        dest[0] = source[0];
    }

    function fillDestArray() public {
        S[10][1] storage dest = getDest();
        for (uint i = 0; i < 10; i++) {
            dest[0][i] = S({
                a: uint64(41 + i * 4),
                b: uint64(42 + i * 4),
                c: uint64(43 + i * 4),
                d: uint64(44 + i * 4)
            });
        }
    }

    function boundaryArray() public view returns (S[10] memory) {
        return getBoundaryArray()[0];
    }

    function destArray() public view returns (S[10] memory) {
        return getDest()[0];
    }

    function canaryValue() public view returns (uint256) {
        return getCanary().value;
    }
}
