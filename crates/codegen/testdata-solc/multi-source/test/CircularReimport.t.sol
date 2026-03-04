// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CircularReimportS3.sol";
contract CircularReimportTest is Test {
    function test_CircularReimport() public {
        C c = new C();
        // In s1: g=f_s2=2, h=g_s2=4; f_s1 = 100 + h - g = 100 + 4 - 2 = 102
        // s3 imports s1, gets f=f_s1=102, g=f_s2=2, h=g_s2=4
        // foo() = f() - g() - h() = 102 - 2 - 4 = 96 = 0x60
        assertEq(c.foo(), 0x60);
    }
}
