// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayTwoStatic.sol";

contract CalldataArrayTwoStaticTest is Test {
    CalldataArrayTwoStatic c;

    function setUp() public {
        c = new CalldataArrayTwoStatic();
    }

    function test_f_which_true() public {
        // f(uint256[3],uint256[2],bool): 23, 42, 87, 51, 72, true -> 32, 96, 23, 42, 87
        uint256[3] memory s1 = [uint256(23), 42, 87];
        uint256[2] memory s2 = [uint256(51), 72];
        bytes memory result = c.f(s1, s2, true);
        uint256[3] memory decoded = abi.decode(result, (uint256[3]));
        assertEq(decoded[0], 23);
        assertEq(decoded[1], 42);
        assertEq(decoded[2], 87);
    }

    function test_f_which_false() public {
        // f(uint256[3],uint256[2],bool): 23, 42, 87, 51, 72, false -> 32, 64, 51, 72
        uint256[3] memory s1 = [uint256(23), 42, 87];
        uint256[2] memory s2 = [uint256(51), 72];
        bytes memory result = c.f(s1, s2, false);
        uint256[2] memory decoded = abi.decode(result, (uint256[2]));
        assertEq(decoded[0], 51);
        assertEq(decoded[1], 72);
    }

    function test_g_which_true() public {
        uint256[3] memory s1 = [uint256(23), 42, 87];
        uint256[2] memory s2 = [uint256(51), 72];
        bytes memory result = c.g(s1, s2, true);
        uint256[3] memory decoded = abi.decode(result, (uint256[3]));
        assertEq(decoded[0], 23);
    }
}
