// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PushNoArgsBytes {
    bytes array;

    function f() public {
        array.push();
    }

    function g(uint x) public {
        for (uint i = 0; i < x; ++i)
            array.push() = bytes1(uint8(i));
    }

    function l() public returns (uint) {
        return array.length;
    }

    function a(uint index) public view returns (bytes1) {
        return array[index];
    }
}
