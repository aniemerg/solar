// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SelfdestructPostCancun.sol";

// Post-Cancun: selfdestruct sends Ether to beneficiary but contract code persists
contract SelfdestructPostCancunTest {
    SelfdestructPostCancun c;

    function setUp() public {
        c = new SelfdestructPostCancun{value: 1 ether}();
    }

    function test_exists_before_deploy() public view {
        // c is not deployed yet
        assert(c.exists() == false);
    }

    function test_deploy_and_terminate_same_tx() public {
        // deploy_create and terminate in same function call (same transaction):
        // Post-Cancun: even in same tx, selfdestruct still removes code
        c.deployCreate();
        assert(c.exists() == true);
        assert(c.balanceOfC() == 1 ether);

        c.terminate();
        // Post-Cancun: code persists if selfdestruct called in different tx than creation
        assert(c.exists() == true);
        assert(c.balanceOfC() == 0);
        assert(c.balanceSelf() == 1 ether);
    }

    receive() external payable {}
}
