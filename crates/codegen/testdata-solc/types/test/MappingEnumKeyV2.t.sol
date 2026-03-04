// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/MappingEnumKeyV2.sol";

contract MappingEnumKeyV2Test is Test {
    MappingEnumKeyV2 c;

    function setUp() public {
        c = new MappingEnumKeyV2();
    }

    function test_valid_keys() public {
        assert(c.get(E.A) == 0);
        assert(c.get(E.B) == 0);
        assert(c.get(E.C) == 0);

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
