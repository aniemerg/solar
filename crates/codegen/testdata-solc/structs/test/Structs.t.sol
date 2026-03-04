// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Structs.sol";

contract StructsTest {
    Structs c;

    function setUp() public {
        c = new Structs();
    }

    function test_Structs() public {
        assert(c.check() == false);
        c.set();
        assert(c.check() == true);
    }
}
