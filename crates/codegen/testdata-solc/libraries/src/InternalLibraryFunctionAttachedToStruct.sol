// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This has to work without linking, because everything will be inlined.
library LStruct {
    struct S {
        uint256[] data;
    }

    function f(S memory _s) internal {
        _s.data[3] = 2;
    }
}

contract InternalLibraryFunctionAttachedToStruct {
    using LStruct for LStruct.S;

    function f() public returns (uint256) {
        LStruct.S memory x;
        x.data = new uint256[](7);
        x.data[3] = 8;
        x.f();
        return x.data[3];
    }
}
