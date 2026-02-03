// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StaticArrayCopyCleanup {
    struct S {
        uint64 a;
        uint64 b;
        uint64 c;
        uint64 d;
    }

    S[5] source;
    S[10] dest;
    uint256 public canary = type(uint256).max;

    function fillSource() public {
        for (uint256 i = 0; i < 5; i++) {
            source[i] = S({
                a: uint64(1 + i * 4),
                b: uint64(2 + i * 4),
                c: uint64(3 + i * 4),
                d: uint64(4 + i * 4)
            });
        }
    }

    function fillDest() public {
        for (uint256 i = 0; i < 10; i++) {
            dest[i] = S({
                a: uint64(100 + i * 4),
                b: uint64(101 + i * 4),
                c: uint64(102 + i * 4),
                d: uint64(103 + i * 4)
            });
        }
    }

    function copySourceToDest() public {
        dest = source;
    }

    function deleteSource() public { delete source; }
    function deleteDest() public { delete dest; }

    function getSourceAsUint() public view returns (uint64[20] memory result) {
        for (uint256 i = 0; i < 5; i++) {
            result[i * 4] = source[i].a;
            result[i * 4 + 1] = source[i].b;
            result[i * 4 + 2] = source[i].c;
            result[i * 4 + 3] = source[i].d;
        }
    }

    function getDestAsUint() public view returns (uint64[40] memory result) {
        for (uint256 i = 0; i < 10; i++) {
            result[i * 4] = dest[i].a;
            result[i * 4 + 1] = dest[i].b;
            result[i * 4 + 2] = dest[i].c;
            result[i * 4 + 3] = dest[i].d;
        }
    }
}
