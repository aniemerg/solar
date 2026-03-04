// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PushNoArgsStruct {
    struct S {
        uint x;
    }

    S[] array;

    function f(uint y) public {
        S storage s = array.push();
        g(s, y);
    }

    function g(S storage s, uint y) internal {
        s.x = y;
    }

    function h(uint y) public {
        g(array.push(), y);
    }

    function lv(uint y) public {
        array.push().x = y;
    }

    function a(uint i) public returns (uint) {
        return array[i].x;
    }

    function l() public returns (uint) {
        return array.length;
    }
}
