// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/TransactionStatus.sol";

contract TransactionStatusTest is Test {
    TransactionStatus c;

    function setUp() public {
        c = new TransactionStatus();
    }

    function test_f_succeeds() public {
        c.f();
    }

    function test_g_reverts() public {
        vm.expectRevert();
        c.g();
    }

    function test_h_reverts() public {
        vm.expectRevert();
        c.h();
    }
}
