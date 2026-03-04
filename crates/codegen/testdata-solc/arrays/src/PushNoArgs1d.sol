// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PushNoArgs1d {
    uint[] array;

    function f() public returns (uint) {
        uint y = array.push();
        return y;
    }

    function lv(uint value) public {
        array.push() = value;
    }

    function a(uint index) public view returns (uint) {
        return array[index];
    }

    function l() public view returns (uint) {
        return array.length;
    }
}
