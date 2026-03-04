// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingEnumKeyLibraryV2.sol";

contract MappingEnumKeyLibraryV2Test {
    MappingEnumKeyLibraryV2 c;

    function setUp() public {
        c = new MappingEnumKeyLibraryV2();
    }

    function test_mapping_with_library() public {
        assert(c.get(E.A) == 0);
        assert(c.get(E.B) == 0);

        c.set(E.B, 0xa1);
        assert(c.get(E.A) == 0);
        assert(c.get(E.B) == 0xa1);

        c.set(E.A, 0xef);
        assert(c.get(E.A) == 0xef);
        assert(c.get(E.B) == 0xa1);

        c.set(E.B, 0x05);
        assert(c.get(E.A) == 0xef);
        assert(c.get(E.B) == 0x05);
    }
}
