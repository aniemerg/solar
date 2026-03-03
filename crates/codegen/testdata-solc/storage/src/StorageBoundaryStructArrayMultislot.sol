// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;
pragma abicoder v2;

contract StorageBoundaryStructArrayMultislot {
    struct S {
        uint256 a;
        uint256 b;
        uint256 c;
        // 3 slots per struct
    }

    struct Canary {
        uint256 value;
    }

    function getBoundaryArray() internal pure returns (S[10][1] storage arr) {
        // 10 structs, each 3 slots = 30 slots total
        assembly {
            arr.slot := sub(0, 15)
        }
    }

    function getDest() internal pure returns (S[10][1] storage arr) {
        assembly {
            arr.slot := 16
        }
    }

    function getCanary() internal pure returns (Canary storage canary) {
        assembly {
            canary.slot := 15
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
                a: 1 + i * 3,
                b: 2 + i * 3,
                c: 3 + i * 3
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
                a: 31 + i * 3,
                b: 32 + i * 3,
                c: 33 + i * 3
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
