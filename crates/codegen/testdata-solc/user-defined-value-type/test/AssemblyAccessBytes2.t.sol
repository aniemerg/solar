// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AssemblyAccessBytes2.sol";

contract AssemblyAccessBytes2Test {
    function test_assemblyAccess() public {
        AssemblyAccessBytes2 c = new AssemblyAccessBytes2();
        bytes2 expected = 0x6162; // "ab"
        assert(c.f(MyBytes2.wrap("ab")) == expected);
        assert(c.g("ab") == expected);
        // h: pass uint256 representation of "ab" (left-aligned)
        uint256 abVal = uint256(uint16(0x6162)) << 240;
        assert(MyBytes2.unwrap(c.h(abVal)) == expected);
    }
}
