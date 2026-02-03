// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataBytesInternal.sol";

contract CalldataBytesInternalTest {
    function test_CalldataBytesInternal() public {
        CalldataBytesInternal c = new CalldataBytesInternal();
        bytes memory input = "abcd";
        assert(c.f(7, input, 7) == bytes1("c"));
    }
}
