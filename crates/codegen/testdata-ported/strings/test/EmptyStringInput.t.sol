// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EmptyStringInput.sol";

contract EmptyStringInputTest {
    EmptyStringInput c;

    function setUp() public {
        c = new EmptyStringInput();
    }

    function test_EmptyStringInput() public view {
        assert(bytes(c.f()).length == 0);
        assert(bytes(c.g("")).length == 0);
        (string memory s1, uint256 v1) = c.h("", 0x888);
        assert(bytes(s1).length == 0);
        assert(v1 == 0x888);
        (string memory s2, string memory s3, uint256 v2) = c.i("", 0x888, "");
        assert(bytes(s2).length == 0);
        assert(bytes(s3).length == 0);
        assert(v2 == 0x888);
        (string memory s4, string memory s5, uint256 v3) = c.j("", 0x888);
        assert(bytes(s4).length == 0);
        assert(bytes(s5).length == 0);
        assert(v3 == 0x888);
    }
}
