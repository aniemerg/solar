// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CircularImport2S2.sol";
contract CircularImport2Test is Test {
    function test_CircularImport2() public {
        C c = new C();
        // h() = f() from s1 = 1000 + g() - h() = 1000 + 4 - 2 = 1002
        // foo() = h() - f() - g() = 1002 - 2 - 4 = 996 ... wait
        // but expected is 992
        // Let's recalculate: h is f from s1, g is g from s2, f is f from s2
        // f_s1 = 1000 + g_s2() - h_s2() = 1000 + 4 - h_s1()
        // h_s2 = f_s1 (circular), so f_s1 = 1000 + 4 - f_s1 => 2*f_s1 = 1004 => ...
        // Actually in Solidity free functions are resolved at compile-time (no recursion)
        // h in s2 = import of f from s1
        // f_s1 uses g (which is f_s2=2) and h (which is g_s2=4) due to aliasing
        // So f_s1 = 1000 + 2 - 4 = 998
        // foo = h() - f() - g() = f_s1() - f_s2() - g_s2() = 998 - 2 - 4 = 992
        assertEq(c.foo(), 992);
    }
}
