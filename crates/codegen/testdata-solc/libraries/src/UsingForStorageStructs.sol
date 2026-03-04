// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct StructForLib { uint256 x; }

library LStorageStruct {
    function f(StructForLib storage _x) internal view returns (uint256) {
        return _x.x;
    }
}

contract UsingForStorageStructs {
    using LStorageStruct for StructForLib;

    StructForLib s;

    function h(StructForLib storage _s) internal view returns (uint256) {
        // _s is pointer
        return _s.f();
    }

    function g() public returns (uint256, uint256) {
        s.x = 7;
        // s is reference
        return (s.f(), h(s));
    }
}
