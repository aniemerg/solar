// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LInternal {
    function f(uint256, bytes calldata _x, uint256) internal pure returns (bytes1) {
        return _x[2];
    }
}

contract CalldataInternalLibrary {
    function f(bytes calldata a) external pure returns (bytes1) {
        return LInternal.f(3, a, 9);
    }

    function g() public returns (bytes1) {
        bytes memory x = new bytes(4);
        x[2] = 0x08;
        return this.f(x);
    }
}
