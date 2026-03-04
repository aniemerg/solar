// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/Constructor.sol";

contract ConstructorTest is Test {
    function test_Constructor() public {
        vm.deal(address(this), 2 ether);
        Constructor c = new Constructor{value: 2}(3);
        assert(c.state() == 3);
        assert(c.balance() == 2);
        c.update(4);
        assert(c.state() == 4);
    }
}
