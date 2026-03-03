// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/WeirdName.sol";

contract WeirdNameTest is Test {
    WeirdName c;

    function setUp() public {
        c = new WeirdName();
    }

    function test_WeirdName() public {
        // f() -> FAILURE, hex"b48fb6cf", 2
        // error(uint256) selector = keccak256("error(uint256)")[0:4]
        bytes4 sel = bytes4(keccak256("error(uint256)"));
        assert(sel == bytes4(0xb48fb6cf));
        vm.expectRevert(abi.encodeWithSelector(sel, uint256(2)));
        c.f();
    }
}
