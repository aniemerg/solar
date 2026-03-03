// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorInitOrder.sol";

contract ConstructorInitOrderTest {
    ConstructorInitOrderB b;

    function setUp() public {
        b = new ConstructorInitOrderB();
    }

    function check_ConstructorInitOrder() public view {
        assert(b.y() == 42);
    }
}
