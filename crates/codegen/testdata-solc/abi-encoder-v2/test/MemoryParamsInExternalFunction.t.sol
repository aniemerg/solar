// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/MemoryParamsInExternalFunction.sol";

contract MemoryParamsInExternalFunctionTest is Test {
    MemoryParamsInExternalFunction c;

    function setUp() public {
        c = new MemoryParamsInExternalFunction();
    }

    function test_g() public {
        // g() -> 3, 0x6200..., 3, 0x6600..., 4, 7
        // a="abc": length=3, a[1]='b'=0x62
        // b="def": length=3, b[2]='f'=0x66
        // c=[0,0,0,7]: length=4, c[3]=7
        (uint aLen, bytes1 a1, uint bLen, bytes1 b2, uint cLen, uint c3) = c.g();
        assertEq(aLen, 3);
        assertEq(a1, bytes1(0x62)); // 'b'
        assertEq(bLen, 3);
        assertEq(b2, bytes1(0x66)); // 'f'
        assertEq(cLen, 4);
        assertEq(c3, 7);
    }
}
