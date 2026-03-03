// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;
pragma abicoder v2;

contract StorageBoundaryStructArrayMixedTypes {
    struct S {
        uint256 a;      // slot 0 (bytes 0-31)
        uint128 b;      // slot 1 (bytes 0-15)
        uint64 c;       // slot 1 (bytes 16-23)
        bytes32 d;      // slot 2 (bytes 0-31)
        bool e;         // slot 3 (byte 0)
        // Total: 4 slots per struct
    }

    struct Canary {
        uint256 value;
    }

    function getBoundaryArray() internal pure returns (S[10][1] storage arr) {
        // 10 structs * 4 slots = 40 slots total
        // Starts at -20, ends at slot 19
        assembly {
            arr.slot := sub(0, 20)
        }
    }

    function getDest() internal pure returns (S[10][1] storage arr) {
        assembly {
            arr.slot := 21
        }
    }

    function getCanary() internal pure returns (Canary storage canary) {
        // Array ends at slot 19, canary at slot 20
        assembly {
            canary.slot := 20
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
                a: 1 + i * 5,
                b: uint128(2 + i * 5),
                c: uint64(3 + i * 5),
                d: bytes32(uint256(4 + i * 5)),
                e: true
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
                a: 51 + i * 5,
                b: uint128(52 + i * 5),
                c: uint64(53 + i * 5),
                d: bytes32(uint256(54 + i * 5)),
                e: true
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
