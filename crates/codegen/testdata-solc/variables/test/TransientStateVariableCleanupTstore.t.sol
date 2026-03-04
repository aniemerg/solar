// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/TransientStateVariableCleanupTstore.sol";

contract TransientStateVariableCleanupTstoreTest {
    function test_TransientStateVariableCleanupTstore() public {
        TransientStateVariableCleanupTstore c = new TransientStateVariableCleanupTstore();
        // tstore puts 0xFFFF but reading as uint8 cleans to 0xFF
        assert(c.f() == 0xff);
    }
}
