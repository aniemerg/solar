// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract NestedArrayElementMemoryToMemory {
    function run1(uint8[][][] memory _a) public returns (uint8[][] memory) {
        return _a[1];
    }

    function run2(uint8[][1][] memory _a) public returns (uint8[][1] memory) {
        return _a[0];
    }

    function run3(uint8[2][][2] memory _a) public returns (uint8[2][] memory) {
        return _a[0];
    }

    function run4(uint16[][] memory _a) public returns (uint16[][] memory) {
        uint16[][][] memory tmp = new uint16[][][](2);
        tmp[1] = _a;
        return tmp[1];
    }

    function run5(uint32[][2] memory _a) public returns (uint32[][2] memory) {
        uint32[][2][] memory tmp = new uint32[][2][](1);
        tmp[0] = _a;
        return tmp[0];
    }

    function run6(uint32[2][] memory _a) public returns (uint32[2][] memory) {
        uint32[2][][] memory tmp = new uint32[2][][](1);
        tmp[0] = _a;
        return tmp[0];
    }
}
