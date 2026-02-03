// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/SimpleError.sol";

contract SimpleErrorTest is Test {
    SimpleError c;

    function setUp() public {
        c = new SimpleError();
    }

    function test_SimpleError() public {
        vm.expectRevert(abi.encodeWithSelector(E.selector, 2, 7));
        c.f();
    }
}
