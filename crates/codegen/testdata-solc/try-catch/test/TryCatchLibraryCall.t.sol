// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchLibraryCall.sol";

contract TryCatchLibraryCallTest {
    function test_TryCatchLibraryCall() public {
        TryCatchLibraryCall c = new TryCatchLibraryCall();

        // f(true) -> 8, ""
        (uint r, string memory msg) = c.f(true);
        assert(r == 8);
        assert(bytes(msg).length == 0);

        // f(false) -> 18, "failure"
        (r, msg) = c.f(false);
        assert(r == 18);
        assert(keccak256(bytes(msg)) == keccak256(bytes("failure")));

        // g(true) -> 9, ""
        (r, msg) = c.g(true);
        assert(r == 9);
        assert(bytes(msg).length == 0);

        // g(false) -> 19, "failure"
        (r, msg) = c.g(false);
        assert(r == 19);
        assert(keccak256(bytes(msg)) == keccak256(bytes("failure")));
    }
}
