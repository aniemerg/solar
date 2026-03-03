// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/RequireDifferentErrorsSameParameters.sol";

contract RequireDifferentErrorsSameParametersTest is Test {
    RequireDifferentErrorsSameParameters c;

    function setUp() public {
        c = new RequireDifferentErrorsSameParameters();
    }

    function test_RequireDifferentErrorsSameParameters() public {
        // f() -> FAILURE, hex"f55fefe3", 1, "two", 3
        vm.expectRevert(abi.encodeWithSelector(bytes4(0xf55fefe3), uint256(1), "two", uint256(3)));
        c.f();

        // g() -> FAILURE, hex"44a06798", 4, "five", 6
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x44a06798), uint256(4), "five", uint256(6)));
        c.g();
    }
}
