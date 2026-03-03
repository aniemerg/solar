// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EnumExplicitOverflow.sol";

contract EnumExplicitOverflowTest is Test {
    EnumExplicitOverflow c;

    function setUp() public {
        c = new EnumExplicitOverflow();
    }

    function test_EnumExplicitOverflow() public {
        assert(c.getChoiceExp(2) == 2);

        vm.expectRevert();
        c.getChoiceExp(3);

        vm.expectRevert();
        c.getChoiceFromSigned(-1);

        vm.expectRevert();
        c.getChoiceFromMax();

        assert(c.getChoiceExp(2) == 2);
        assert(c.getChoiceExp(0) == 0);
    }
}
