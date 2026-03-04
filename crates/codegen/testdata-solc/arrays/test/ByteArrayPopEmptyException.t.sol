// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrayPopEmptyException.sol";

contract ByteArrayPopEmptyExceptionTest is Test {
    function test_ByteArrayPopEmptyException() public {
        ByteArrayPopEmptyException c = new ByteArrayPopEmptyException();
        vm.expectRevert();
        c.runTest();
    }
}
