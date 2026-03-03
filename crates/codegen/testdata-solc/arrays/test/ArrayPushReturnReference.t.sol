// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ArrayPushReturnReference.sol";

contract ArrayPushReturnReferenceTest is Test {
    ArrayPushReturnReference c;

    function setUp() public {
        c = new ArrayPushReturnReference();
    }

    function test_ArrayPushReturnReference() public {
        assert(c.getLength() == 0);
        c.test(42);
        assert(c.getLength() == 1);
        assert(c.fetch(0) == 42);
        vm.expectRevert();
        c.fetch(1);
        c.test(23);
        assert(c.getLength() == 2);
        assert(c.fetch(0) == 42);
        assert(c.fetch(1) == 23);
        vm.expectRevert();
        c.fetch(2);
    }
}
