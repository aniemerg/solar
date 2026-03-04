// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataStructSimple.sol";

contract CalldataStructSimpleTest is Test {
    CalldataStructSimple c;

    function setUp() public {
        c = new CalldataStructSimple();
    }

    function test_f() public {
        // f((uint256)): 3 -> 32, 32, 3
        CalldataStructSimple.S memory s = CalldataStructSimple.S(3);
        bytes memory result = c.f(s);
        CalldataStructSimple.S memory decoded = abi.decode(result, (CalldataStructSimple.S));
        assertEq(decoded.a, 3);
    }

    function test_g() public {
        // g((uint256)): 3 -> 32, 32, 3
        CalldataStructSimple.S memory s = CalldataStructSimple.S(3);
        bytes memory result = c.g(s);
        CalldataStructSimple.S memory decoded = abi.decode(result, (CalldataStructSimple.S));
        assertEq(decoded.a, 3);
    }
}
