// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrayPopLongStorageEmptyGarbageRef.sol";

contract ByteArrayPopLongStorageEmptyGarbageRefTest is Test {
    function test_ByteArrayPopLongStorageEmptyGarbageRef() public {
        ByteArrayPopLongStorageEmptyGarbageRef c = new ByteArrayPopLongStorageEmptyGarbageRef();
        c.runTest();
    }
}
