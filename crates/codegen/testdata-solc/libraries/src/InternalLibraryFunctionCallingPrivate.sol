// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Tests that internal library functions that are called from outside and that
// themselves call private functions are still able to (i.e. the private function
// also has to be pulled into the caller's code)
// This has to work without linking, because everything will be inlined.
library LPrivate {
    function g(uint256[] memory _data) private {
        _data[3] = 2;
    }

    function f(uint256[] memory _data) internal {
        g(_data);
    }
}

contract InternalLibraryFunctionCallingPrivate {
    function f() public returns (uint256) {
        uint256[] memory x = new uint256[](7);
        x[3] = 8;
        LPrivate.f(x);
        return x[3];
    }
}
