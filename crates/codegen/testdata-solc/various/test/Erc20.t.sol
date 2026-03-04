// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Erc20.sol";

contract Erc20Test {
    Erc20 c;
    address sender;
    address recipient = address(2);

    function setUp() public {
        sender = address(this);
        c = new Erc20();
    }

    function test_totalSupply() public view {
        assert(c.totalSupply() == 20);
    }

    function test_transfer() public {
        bool ok = c.transfer(recipient, 5);
        assert(ok == true);
        assert(c.balanceOf(sender) == 15);
        assert(c.balanceOf(recipient) == 5);
    }

    function test_decreaseAllowance_to_zero() public {
        bool ok = c.decreaseAllowance(recipient, 0);
        assert(ok == true);
        assert(c.allowance(sender, recipient) == 0);
    }

    function test_decreaseAllowance_underflow_reverts() public {
        // allowance is 0, subtracting 1 should revert (arithmetic underflow)
        (bool success,) = address(c).call(
            abi.encodeWithSelector(c.decreaseAllowance.selector, recipient, 1)
        );
        assert(!success);
    }

    function test_transfer_insufficient_reverts() public {
        // transfer 14, leaving 6; then transfer 7 should revert
        c.transfer(recipient, 14);
        (bool success,) = address(c).call(
            abi.encodeWithSelector(c.transfer.selector, recipient, uint256(7))
        );
        assert(!success);
    }
}
