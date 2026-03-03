// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmptyNonemptyEmpty {
    bytes public x;

    function set(bytes memory _a) public {
        x = _a;
    }

    function storageEmpty() public view returns (bool) {
        return x.length == 0;
    }
}
