// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import {Test} from "forge-std/Test.sol";
import "../src/UsingStructs.sol";

contract UsingStructsTest is Test {
    UsingStructs c;

    function setUp() public {
        c = new UsingStructs();
    }

    function test_UsingStructs() public {
        // f(bool): true -> FAILURE, hex"e96e07f0", 2, S(9, "abc"), 7
        bytes4 sel = bytes4(keccak256("E(uint256,(uint256,string),uint256)"));
        assert(sel == bytes4(0xe96e07f0));

        vm.expectRevert(abi.encodeWithSelector(sel, uint256(2), S(9, "abc"), uint256(7)));
        c.f(true);

        vm.expectRevert(abi.encodeWithSelector(sel, uint256(2), S(9, "abc"), uint256(7)));
        c.f(false);
    }
}
