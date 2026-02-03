// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EtherNonPayableFunction.sol";

contract EtherNonPayableFunctionTest is Test {
    EtherNonPayableFunction c;

    function setUp() public {
        c = new EtherNonPayableFunction();
        vm.deal(address(this), 1 ether);
    }

    function test_EtherNonPayableFunction() public {
        vm.expectRevert();
        c.f{value: 1 ether}();

        (bool ok,) = address(c).call("");
        assert(!ok);
    }
}
