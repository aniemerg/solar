// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/RequireInheritedError.sol";

contract RequireInheritedErrorTest is Test {
    RequireInheritedError c;

    function setUp() public {
        c = new RequireInheritedError();
    }

    function test_RequireInheritedError() public {
        // f() -> FAILURE, hex"11a1077e", 1, "two", 3
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x11a1077e), uint256(1), "two", uint256(3)));
        c.f();
    }
}
