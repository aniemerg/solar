// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SelfdestructPostCancunMultipleBeneficiaries.sol";

contract SelfdestructPostCancunMultipleBeneficiariesTest {
    SelfdestructPostCancunMultipleBeneficiaries c;
    address account1 = address(0x1111111111111111111111111111111111111111);
    address account2 = address(0x2222222222222222222222222222222222222222);

    function setUp() public {
        c = new SelfdestructPostCancunMultipleBeneficiaries{value: 2 ether}();
    }

    function test_deploy_and_terminate_once() public {
        c.deploy();
        assert(c.exists() == true);
        assert(account1.balance == 0);

        c.terminate(account1);
        // Post-Cancun: ether transferred, but code persists
        assert(c.exists() == true);
        assert(account1.balance == 1 ether);
    }

    receive() external payable {}
}
