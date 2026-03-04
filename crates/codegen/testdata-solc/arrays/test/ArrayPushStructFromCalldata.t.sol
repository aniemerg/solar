// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "forge-std/Test.sol";
import "../src/ArrayPushStructFromCalldata.sol";

contract ArrayPushStructFromCalldataTest is Test {
    function test_ArrayPushStructFromCalldata() public {
        ArrayPushStructFromCalldata c = new ArrayPushStructFromCalldata();
        uint16[3] memory cArr;
        cArr[0] = 0;
        cArr[1] = 0;
        cArr[2] = 4;
        uint16[] memory dArr = new uint16[](4);
        dArr[0] = 0;
        dArr[1] = 0;
        dArr[2] = 5;
        dArr[3] = 0;
        ArrayPushStructFromCalldata.S memory s;
        s.a = 2;
        s.b = 3;
        s.c = cArr;
        s.d = dArr;
        (uint16 a, uint16 b, uint16 cv, uint16 d) = c.runTest(s);
        assertEq(a, 2);
        assertEq(b, 3);
        assertEq(cv, 4);
        assertEq(d, 5);
    }
}
