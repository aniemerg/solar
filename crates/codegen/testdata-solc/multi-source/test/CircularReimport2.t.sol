// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CircularReimport2S3.sol";
contract CircularReimport2Test is Test {
    function test_CircularReimport2() public {
        C c = new C();
        // In s1: g=f_s2=2, h=g_s2=4; f_s1=1000+h-g=1000+4-2=1002
        // s3 imports s2: gets f=f_s2=2, g=g_s2=4, h=f_s1=1002
        // foo()=10000+f()-g()-h()=10000+2-4-1002=8996=0x2324
        assertEq(c.foo(), 0x2324);
    }
}
