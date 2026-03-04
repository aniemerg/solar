// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/FailedCreate.sol";

contract FailedCreateTest is Test {
    FailedCreate c;

    function setUp() public {
        c = new FailedCreate{value: 20 wei}();
    }

    function test_f_with_sufficient_value() public {
        // f(20): x++ makes x=1, deploys D with salt=bytes32(1) and value=20
        c.f(20);
        assert(c.x() == 1);
    }

    function test_f_second_call_reverts_no_ether() public {
        c.f(20); // deploys D, x=1, spends all 20 wei
        assert(c.x() == 1);
        // Second call: no ether left, f(20) reverts (x reverts to 1)
        vm.expectRevert();
        c.f(20);
        assert(c.x() == 1);
    }

    function test_stack_deep_reverts_x_unchanged() public {
        // stack(1023) causes stack overflow → reverts. x starts at 0, stays 0.
        vm.expectRevert();
        c.stack(1023);
        assert(c.x() == 0);
    }

    function test_stack_shallow_succeeds_x_incremented() public {
        // stack(10) recurses then calls f(0): deploys D with value=0, x becomes 1
        c.stack(10);
        assert(c.x() == 1);
    }
}
