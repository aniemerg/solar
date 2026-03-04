// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPopEmptyException.sol";

contract ArrayPopEmptyExceptionTest is Test {
    function test_ArrayPopEmptyException() public {
        ArrayPopEmptyException c = new ArrayPopEmptyException();
        vm.expectRevert();
        c.runTest();
    }
}
