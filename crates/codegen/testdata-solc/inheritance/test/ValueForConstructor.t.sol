// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ValueForConstructor.sol";

contract ValueForConstructorTest {
    Main m;

    function setUp() public {
        m = new Main{value: 22}();
    }

    receive() external payable {}

    function test_ValueForConstructor() public {
        assert(m.getFlag() == true);
        assert(m.getName() == "abc");
        (uint256 me, uint256 them) = m.getBalances();
        assert(me == 12);
        assert(them == 10);
    }
}
