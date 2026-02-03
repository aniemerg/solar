// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LString {
    function at(string memory a, uint256 i) internal pure returns (uint8) {
        return uint8(bytes(a)[i]);
    }
}

contract InternalLibraryFunctionAttachedToStringMemory {
    using LString for string;

    function secondChar() public pure returns (uint8) {
        string memory input = "abc";
        return input.at(1);
    }
}
