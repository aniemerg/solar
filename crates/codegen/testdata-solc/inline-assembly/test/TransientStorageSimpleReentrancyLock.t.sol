// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/TransientStorageSimpleReentrancyLock.sol";

contract TransientStorageSimpleReentrancyLockTest is Test {
    TransientStorageSimpleReentrancyLock c;

    function setUp() public {
        c = new TransientStorageSimpleReentrancyLock();
    }

    // f(bool): false ->  (should not revert)
    function test_f_false() public {
        c.f(false);
    }

    // f(bool): true -> FAILURE (reentrancy reverts)
    function test_f_true() public {
        vm.expectRevert();
        c.f(true);
    }
}
