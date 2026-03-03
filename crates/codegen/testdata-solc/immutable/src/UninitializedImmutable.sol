// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UninitializedImmutable {
    uint immutable u;
    bool immutable b;
    address immutable a;

    function get() public returns (uint, bool, address) {
        return (u, b, a);
    }
}
