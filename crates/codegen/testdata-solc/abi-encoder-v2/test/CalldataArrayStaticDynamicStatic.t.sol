// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayStaticDynamicStatic.sol";

contract CalldataArrayStaticDynamicStaticTest is Test {
    CalldataArrayStaticDynamicStatic c;

    function setUp() public {
        c = new CalldataArrayStaticDynamicStatic();
    }

    function test_g() public {
        bytes memory result = c.g();
        assertTrue(result.length > 0);
    }

    function test_g_equals_h() public {
        bytes memory resultG = c.g();
        bytes memory resultH = c.h();
        assertEq(resultG.length, resultH.length);
        for (uint k = 0; k < resultG.length; k++) {
            assertEq(resultG[k], resultH[k]);
        }
    }

    function test_i_equals_j() public {
        bytes memory resultI = c.i();
        bytes memory resultJ = c.j();
        assertEq(resultI.length, resultJ.length);
        for (uint k = 0; k < resultI.length; k++) {
            assertEq(resultI[k], resultJ[k]);
        }
    }
}
