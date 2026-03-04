// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPushNested.sol";

contract ArrayPushNestedTest is Test {
    function test_ArrayPushNested() public {
        ArrayPushNested c = new ArrayPushNested();
        c.f();
    }
}
