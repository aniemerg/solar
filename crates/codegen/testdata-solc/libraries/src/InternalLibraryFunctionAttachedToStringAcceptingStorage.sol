// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LStringStorage {
    function f(string memory a) internal pure returns (string memory) {
        return a;
    }
    function g(string storage a) internal pure returns (string memory) {
        return a;
    }
}

contract InternalLibraryFunctionAttachedToStringAcceptingStorage {
    using LStringStorage for string;
    string s;

    function run(string calldata x) public returns (string memory, string memory) {
        s = x;
        return (s.f(), s.g());
    }
}
