// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FixedBytesIndexAccess.sol";

contract FixedBytesIndexAccessTest {
    FixedBytesIndexAccess c;

    function setUp() public {
        c = new FixedBytesIndexAccess();
    }

    function test_FixedBytesIndexAccess() public {
        bytes32 x = bytes32("789");
        assert(c.f(x) == bytes1("9"));
        assert(c.g(x) == 0x35);
        assert(c.data(1) == bytes16(bytes1("8")));
    }
}
