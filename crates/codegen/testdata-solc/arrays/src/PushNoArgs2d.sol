// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PushNoArgs2d {
    uint[][] array2d;

    function l() public returns (uint) {
        return array2d.length;
    }

    function ll(uint index) public returns (uint) {
        return array2d[index].length;
    }

    function a(uint i, uint j) public returns (uint) {
        return array2d[i][j];
    }

    function f(uint index, uint value) public {
        uint[] storage pointer = array2d.push();
        for (uint i = 0; i <= index; ++i)
            pointer.push();
        pointer[index] = value;
    }

    function lv(uint value) public {
        array2d.push().push() = value;
    }
}
