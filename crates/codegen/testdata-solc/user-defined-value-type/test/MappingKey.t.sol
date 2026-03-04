// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingKey.sol";

contract MappingKeyTest {
    function test_mappingKey() public {
        MappingKey c = new MappingKey();
        c.set(MyInt.wrap(1), 1);
        assert(c.m(MyInt.wrap(1)) == 1);
        c.set_unwrapped(1, 2);
        assert(c.m(MyInt.wrap(1)) == 2);
        assert(c.m(MyInt.wrap(2)) == 0);
    }
}
