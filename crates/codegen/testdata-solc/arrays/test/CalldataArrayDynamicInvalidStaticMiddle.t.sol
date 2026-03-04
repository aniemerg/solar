// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayDynamicInvalidStaticMiddle.sol";

contract CalldataArrayDynamicInvalidStaticMiddleTest is Test {
    CalldataArrayDynamicInvalidStaticMiddle c;

    function setUp() public {
        c = new CalldataArrayDynamicInvalidStaticMiddle();
    }

    function callF(bytes memory encodedArgs) internal returns (bool ok, uint256 res) {
        bytes memory data = abi.encodePacked(c.f.selector, encodedArgs);
        bytes memory ret;
        (ok, ret) = address(c).call(data);
        if (ok && ret.length >= 32) res = abi.decode(ret, (uint256));
    }

    function callG(bytes memory encodedArgs) internal returns (bool ok, uint256 res) {
        bytes memory data = abi.encodePacked(c.g.selector, encodedArgs);
        bytes memory ret;
        (ok, ret) = address(c).call(data);
        if (ok && ret.length >= 32) res = abi.decode(ret, (uint256));
    }

    function callH(bytes memory encodedArgs) internal returns (bool ok, uint256 res) {
        bytes memory data = abi.encodePacked(c.h.selector, encodedArgs);
        bytes memory ret;
        (ok, ret) = address(c).call(data);
        if (ok && ret.length >= 32) res = abi.decode(ret, (uint256));
    }

    function test_CalldataArrayDynamicInvalidStaticMiddle() public {
        bool ok;
        uint256 res;

        // f(uint256[][1][]): 0x20, 0x0 -> 42
        (ok, res) = callF(abi.encodePacked(uint256(0x20), uint256(0)));
        assertTrue(ok);
        assertEq(res, 42);

        // f(uint256[][1][]): 0x20, 0x1 -> FAILURE (missing offset)
        (ok,) = callF(abi.encodePacked(uint256(0x20), uint256(1)));
        assertFalse(ok);

        // f(uint256[][1][]): 0x20, 0x1, 0x20 -> 42
        (ok, res) = callF(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20)));
        assertTrue(ok);
        assertEq(res, 42);

        // g(uint256[][1][]): 0x20, 0x1, 0x20 -> FAILURE
        (ok,) = callG(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20)));
        assertFalse(ok);

        // f(uint256[][1][]): 0x20, 0x1, 0x20, 0x20 -> 42
        (ok, res) = callF(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20), uint256(0x20)));
        assertTrue(ok);
        assertEq(res, 42);

        // g(uint256[][1][]): 0x20, 0x1, 0x20, 0x20 -> 42
        (ok, res) = callG(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20), uint256(0x20)));
        assertTrue(ok);
        assertEq(res, 42);

        // h(uint256[][1][]): 0x20, 0x1, 0x20, 0x20 -> FAILURE
        (ok,) = callH(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20), uint256(0x20)));
        assertFalse(ok);

        // f(uint256[][1][]): 0x20, 0x1, 0x20, 0x20, 0x1 -> 42
        (ok, res) = callF(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20), uint256(0x20), uint256(1)));
        assertTrue(ok);
        assertEq(res, 42);

        // g(uint256[][1][]): 0x20, 0x1, 0x20, 0x20, 0x1 -> 42
        (ok, res) = callG(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20), uint256(0x20), uint256(1)));
        assertTrue(ok);
        assertEq(res, 42);

        // h(uint256[][1][]): 0x20, 0x1, 0x20, 0x20, 0x1 -> FAILURE (inner array has 1 element but h accesses [0][0] which needs the element's length)
        (ok,) = callH(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20), uint256(0x20), uint256(1)));
        assertFalse(ok);
    }
}
