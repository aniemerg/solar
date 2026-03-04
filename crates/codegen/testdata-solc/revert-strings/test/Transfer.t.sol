// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/Transfer.sol";

contract TransferTest is Test {
    Transfer c;

    function setUp() public {
        c = new Transfer();
        vm.deal(address(c), 10 wei);
    }

    function test_Transfer_Balance() public view {
        assert(c.g() == 10);
    }

    function test_Transfer_f_Reverts() public {
        // transfer(1 wei) to A which reverts in receive()
        vm.expectRevert();
        c.f();
    }

    function test_Transfer_h_Reverts() public {
        // transfer(100 ether) fails because contract only has 10 wei
        vm.expectRevert();
        c.h();
    }
}
