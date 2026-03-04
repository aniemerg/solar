// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Multisource.sol";

contract MultisourceTest {
    function test_intType() public {
        Multisource c = new Multisource();
        assert(MyInt.unwrap(c.f(5)) == 5);
    }

    function test_addressType() public {
        Multisource c = new Multisource();
        assert(MyAddress.unwrap(c.fAddr(address(1))) == address(1));
    }
}
