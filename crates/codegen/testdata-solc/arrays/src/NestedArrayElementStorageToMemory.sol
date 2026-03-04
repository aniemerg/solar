// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract NestedArrayElementStorageToMemory {
    uint8[][][] a1 = new uint8[][][](2);
    uint8[][][2] a2;
    uint8[][2][] a3 = new uint8[][2][](1);
    uint8[2][][] a4 = new uint8[2][][](2);

    constructor() {
        a1[1] = new uint8[][](2);
        a1[1][0] = [3, 4];
        a1[1][1] = [5, 6];

        a2[0] = new uint8[][](2);
        a2[0][0] = [6, 7];
        a2[0][1] = [8, 9];
        a2[1] = new uint8[][](2);
        a2[1][0] = [10, 11];

        a3[0][0] = [3, 4];
        a3[0][1] = [5, 6];

        a4[0] = new uint8[2][](1);
        a4[0][0] = [17, 23];
        a4[1] = new uint8[2][](1);
        a4[1][0] = [19, 31];
    }

    function run1() public returns (uint8[][] memory) {
        return a1[1];
    }

    function run2() public returns (uint8[][] memory) {
        return a2[0];
    }

    function run3() public returns (uint8[][2] memory) {
        return a3[0];
    }

    function run4() public returns (uint8[2][] memory) {
        return a4[1];
    }

    function run5() public returns (uint8[][][] memory) {
        uint8[][][] memory tmp = new uint8[][][](3);
        tmp[1] = a1[1];
        return tmp;
    }

    function run6() public returns (uint8[][2][] memory) {
        uint8[][2][] memory tmp = new uint8[][2][](2);
        tmp[0] = a3[0];
        return tmp;
    }

    function run7() public returns (uint8[2][][] memory) {
        uint8[2][][] memory tmp = new uint8[2][][](1);
        tmp[0] = a4[0];
        return tmp;
    }
}
