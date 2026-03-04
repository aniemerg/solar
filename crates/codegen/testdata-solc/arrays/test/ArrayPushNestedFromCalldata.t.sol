// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPushNestedFromCalldata.sol";

contract ArrayPushNestedFromCalldataTest is Test {
    function test_ArrayPushNestedFromCalldata() public {
        ArrayPushNestedFromCalldata c = new ArrayPushNestedFromCalldata();
        uint120[] memory arr = new uint120[](3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        assertEq(c.f(arr), 1);
    }
}
