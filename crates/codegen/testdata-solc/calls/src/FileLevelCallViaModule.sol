// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Inlined from two-file test: free function overloads, called via module alias.
// Original: a.sol defines f(uint) and f(bytes memory), b.sol imports as M and calls M.f(2) and M.f("abc").

function f(uint) pure returns (uint) { return 7; }
function f(bytes memory x) pure returns (uint) { return x.length; }

contract FileLevelCallViaModule {
    function run() public pure returns (uint, uint) {
        return (f(2), f("abc"));
    }
}
