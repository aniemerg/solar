// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ReceiveInherited.sol";

contract ReceiveInheritedTest is Test {
    ReceiveInheritedB c;

    function setUp() public {
        c = new ReceiveInheritedB();
        vm.deal(address(this), 1 ether);
    }

    function test_ReceiveInherited() public {
        assert(c.getData() == 0);
        (bool ok1,) = address(c).call("");
        assert(ok1);
        assert(c.getData() == 1);
        (bool ok2,) = address(c).call{value: 1 ether}("");
        assert(ok2);
        assert(c.getData() == 2);
    }
}
