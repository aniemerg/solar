// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchCreate.sol";

contract TryCatchCreateTest {
    function test_TryCatchCreate() public {
        TryCatchCreate c = new TryCatchCreate();

        (bool created, string memory txt) = c.f();
        assert(!created);
        assert(keccak256(bytes(txt)) == keccak256(bytes("test message.")));

        (created, txt) = c.g();
        assert(created);
        assert(keccak256(bytes(txt)) == keccak256(bytes("success")));
    }
}
