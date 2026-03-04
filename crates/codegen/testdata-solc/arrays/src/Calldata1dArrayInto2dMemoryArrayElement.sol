// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

// Example from https://github.com/argotorg/solidity/issues/12558
contract Calldata1dArrayInto2dMemoryArrayElementC {
    function f(uint[] calldata a) external returns (uint[][] memory) {
        uint[][] memory m = new uint[][](2);
        m[0] = a;

        return m;
    }
}
contract Calldata1dArrayInto2dMemoryArrayElement {
    Calldata1dArrayInto2dMemoryArrayElementC immutable c = new Calldata1dArrayInto2dMemoryArrayElementC();

    function runTest() external returns (bool) {
        uint[] memory arr = new uint[](4);

        arr[0] = 13;
        arr[1] = 14;
        arr[2] = 15;
        arr[3] = 16;

        uint[][] memory ret = c.f(arr);
        assert(ret.length == 2);
        assert(ret[0].length == 4);
        assert(ret[0][0] == 13);
        assert(ret[0][1] == 14);
        assert(ret[0][2] == 15);
        assert(ret[0][3] == 16);
        assert(ret[1].length == 0);

        return true;
    }
}
