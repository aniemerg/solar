// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingContractKeyGetter.sol";

contract MappingContractKeyGetterTest {
    MappingContractKeyGetter c;

    function setUp() public {
        c = new MappingContractKeyGetter();
    }

    function test_getter_and_set() public {
        A k0 = A(address(0));
        A k1 = A(address(0x01));
        A ka7 = A(address(0xa7));

        assert(c.table(k0) == 0);
        assert(c.table(k1) == 0);
        assert(c.table(ka7) == 0);
        assert(c.get(k0) == 0);
        assert(c.get(k1) == 0);
        assert(c.get(ka7) == 0);

        c.set(k1, 0xa1);
        assert(c.table(k0) == 0);
        assert(c.table(k1) == 0xa1);
        assert(c.table(ka7) == 0);
        assert(c.get(k0) == 0);
        assert(c.get(k1) == 0xa1);
        assert(c.get(ka7) == 0);

        c.set(k0, 0xef);
        assert(c.table(k0) == 0xef);
        assert(c.table(k1) == 0xa1);
        assert(c.table(ka7) == 0);

        c.set(k1, 0x05);
        assert(c.table(k0) == 0xef);
        assert(c.table(k1) == 0x05);
        assert(c.table(ka7) == 0);
    }
}
