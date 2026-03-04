// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArray.sol";

contract CalldataArrayTest is Test {
    CalldataArray c;

    function setUp() public {
        c = new CalldataArray();
    }

    function test_f_empty() public {
        // f(uint256[][1]): 32, 32, 0 -> true
        uint256[][] memory s = new uint256[][](1);
        s[0] = new uint256[](0);
        // cast to uint256[][1] - we pass as memory
        uint256[][1] memory s1;
        s1[0] = s[0];
        bool result = c.f(s1);
        assertEq(result, true);
    }

    function test_f_one_element() public {
        // f(uint256[][1]): 32, 32, 1, 42 -> true
        uint256[][1] memory s;
        s[0] = new uint256[](1);
        s[0][0] = 42;
        bool result = c.f(s);
        assertEq(result, true);
    }

    function test_f_eight_elements() public {
        // f(uint256[][1]): 32, 32, 8, 421, 422, 423, 424, 425, 426, 427, 428 -> true
        uint256[][1] memory s;
        s[0] = new uint256[](8);
        s[0][0] = 421; s[0][1] = 422; s[0][2] = 423; s[0][3] = 424;
        s[0][4] = 425; s[0][5] = 426; s[0][6] = 427; s[0][7] = 428;
        bool result = c.f(s);
        assertEq(result, true);
    }
}
