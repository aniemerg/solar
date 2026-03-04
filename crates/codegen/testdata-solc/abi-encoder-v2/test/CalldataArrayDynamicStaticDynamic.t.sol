// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayDynamicStaticDynamic.sol";

contract CalldataArrayDynamicStaticDynamicTest is Test {
    CalldataArrayDynamicStaticDynamic c;

    function setUp() public {
        c = new CalldataArrayDynamicStaticDynamic();
    }

    function test_g() public {
        // g() -> 32, 196, hex"eccb829a", 32, 1, 32, 32, 1, 42, hex"00000000000000000000000000000000000000000000000000000000"
        // g() returns bytes memory which is the msg.data from calling f(), i.e. selector + encoded args
        bytes memory result = c.g();
        // Result is at least 4 (selector) + 32*7 (args) = 228 bytes
        assertTrue(result.length >= 196);
        // First 4 bytes are the selector for f(uint8[][1][])
        bytes4 selector = CalldataArrayDynamicStaticDynamic.f.selector;
        bytes4 resultSelector;
        assembly { resultSelector := mload(add(result, 0x20)) }
        assertEq(resultSelector, selector);
    }

    function test_h() public {
        // h() -> 32, 196, hex"eccb829a", 32, 1, 32, 32, 1, 42, hex"00000000000000000000000000000000000000000000000000000000"
        bytes memory resultG = c.g();
        bytes memory resultH = c.h();
        assertEq(resultG.length, resultH.length);
        for (uint i = 0; i < resultG.length; i++) {
            assertEq(resultG[i], resultH[i]);
        }
    }
}
