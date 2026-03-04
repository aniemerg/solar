// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingEnumKeyGetterV2.sol";

contract MappingEnumKeyGetterV2Test {
    MappingEnumKeyGetterV2 c;

    function setUp() public {
        c = new MappingEnumKeyGetterV2();
    }

    function test_getter_and_set() public {
        assert(c.table(MappingEnumKeyGetterV2.E.A) == 0);
        assert(c.table(MappingEnumKeyGetterV2.E.B) == 0);

        c.set(MappingEnumKeyGetterV2.E.B, 0xa1);
        assert(c.table(MappingEnumKeyGetterV2.E.A) == 0);
        assert(c.table(MappingEnumKeyGetterV2.E.B) == 0xa1);

        c.set(MappingEnumKeyGetterV2.E.A, 0xef);
        assert(c.table(MappingEnumKeyGetterV2.E.A) == 0xef);

        c.set(MappingEnumKeyGetterV2.E.B, 0x05);
        assert(c.table(MappingEnumKeyGetterV2.E.B) == 0x05);
    }
}
