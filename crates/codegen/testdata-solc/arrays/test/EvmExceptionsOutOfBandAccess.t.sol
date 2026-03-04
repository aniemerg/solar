// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/EvmExceptionsOutOfBandAccess.sol";

contract EvmExceptionsOutOfBandAccessTest is Test {
    function test_EvmExceptionsOutOfBandAccess() public {
        EvmExceptionsOutOfBandAccess c = new EvmExceptionsOutOfBandAccess();
        assertFalse(c.tested());

        vm.expectRevert();
        c.runTestIt();

        // tested remains false because testIt reverted before setting it
        assertFalse(c.tested());
    }
}
