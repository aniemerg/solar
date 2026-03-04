// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Erc20.sol";
import {Test} from "forge-std/Test.sol";

contract Erc20Test is Test {
    Erc20 token;
    address alice = address(this);
    address bob = address(2);

    function setUp() public {
        token = new Erc20();
    }

    function test_totalSupply() public {
        assert(UFixed18.unwrap(token.totalSupply()) == 20);
    }

    function test_transfer() public {
        assert(token.transfer(bob, UFixed18.wrap(5)));
        assert(UFixed18.unwrap(token.balanceOf(alice)) == 15);
        assert(UFixed18.unwrap(token.balanceOf(bob)) == 5);
    }

    function test_decreaseAllowance_to_zero() public {
        assert(token.decreaseAllowance(bob, UFixed18.wrap(0)));
    }

    function test_decreaseAllowance_underflow() public {
        vm.expectRevert();
        token.decreaseAllowance(bob, UFixed18.wrap(1));
    }

    function test_transfer_insufficient() public {
        token.transfer(bob, UFixed18.wrap(14));
        vm.expectRevert();
        token.transfer(bob, UFixed18.wrap(7));
    }
}
