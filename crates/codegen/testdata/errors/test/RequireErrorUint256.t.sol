// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/RequireErrorUint256.sol";

contract RequireErrorUint256Test is Test {
    RequireErrorUint256 c;

    function setUp() public {
        c = new RequireErrorUint256();
    }

    function test_RequireErrorUint256_f() public {
        vm.expectRevert(abi.encodeWithSelector(CustomErrorUint.selector, 1));
        c.f();
    }

    function test_RequireErrorUint256_g() public {
        vm.expectRevert(abi.encodeWithSelector(CustomErrorUint.selector, 2));
        c.g();
    }
}
