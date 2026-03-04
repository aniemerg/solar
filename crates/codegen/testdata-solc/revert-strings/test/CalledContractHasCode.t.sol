// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CalledContractHasCode.sol";

contract CalledContractHasCodeTest is Test {
    CalledContractHasCode c;

    function setUp() public {
        c = new CalledContractHasCode();
    }

    function test_CalledContractHasCode() public {
        // g() calls f() on address(0) which has no code -> FAILURE
        vm.expectRevert();
        c.g();
    }
}
