// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TransientStorageReentrancyLock.sol";

contract TransientStorageReentrancyLockTest {
    TransientStorageReentrancyLock c;

    function setUp() public {
        c = new TransientStorageReentrancyLock();
    }

    function test_reentrancy_attempt_reverts() public {
        (bool success,) = address(c).call(
            abi.encodeWithSelector(c.tryCall.selector, address(0x1234abcd), true)
        );
        assert(!success);
    }

    function test_no_reentrancy_succeeds() public {
        (bool success,) = address(c).call(
            abi.encodeWithSelector(c.tryCall.selector, address(0x1234abcd), false)
        );
        assert(success);
    }
}
