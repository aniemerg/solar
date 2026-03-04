// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This has to work without linking, because everything will be inlined.
library LReturnVarSize {
    struct S {
        uint256[] data;
    }

    function f(S memory _s) internal returns (uint256[] memory) {
        _s.data[3] = 2;
        return _s.data;
    }
}

contract InternalLibraryFunctionReturnVarSize {
    using LReturnVarSize for LReturnVarSize.S;

    function f() public returns (uint256) {
        LReturnVarSize.S memory x;
        x.data = new uint256[](7);
        x.data[3] = 8;
        return x.f()[3];
    }
}
