// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataBytesExternal.sol";

contract CalldataBytesExternalTest {
    function test_CalldataBytesExternal() public {
        CalldataBytesExternal c = new CalldataBytesExternal();
        bytes memory input = "abcdefgh";
        assert(c.probe(input) == bytes1("c"));
    }
}
