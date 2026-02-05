// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library L {
    function f(uint256[] memory _data) internal pure {
        _data[3] = 2;
    }
}

contract InternalLibraryFunction {
    function f() public pure returns (uint256) {
        uint256[] memory x = new uint256[](7);
        x[3] = 8;
        L.f(x);
        return x[3];
    }
}
