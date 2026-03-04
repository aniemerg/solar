// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayStaticIndexAccess.sol";

contract CalldataArrayStaticIndexAccessTest is Test {
    CalldataArrayStaticIndexAccess c;

    function setUp() public {
        c = new CalldataArrayStaticIndexAccess();
    }

    function test_g_index0() public {
        // g(uint256[3][2],uint256): 23, 42, 87, 123, 142, 187, 0 -> 32, 96, 23, 42, 87
        uint256[3][2] memory s;
        s[0] = [uint256(23), 42, 87];
        s[1] = [uint256(123), 142, 187];
        bytes memory result = c.g(s, 0);
        uint256[3] memory decoded = abi.decode(result, (uint256[3]));
        assertEq(decoded[0], 23);
        assertEq(decoded[1], 42);
        assertEq(decoded[2], 87);
    }

    function test_g_index1() public {
        // g(uint256[3][2],uint256): 23, 42, 87, 123, 142, 187, 1 -> 32, 96, 123, 142, 187
        uint256[3][2] memory s;
        s[0] = [uint256(23), 42, 87];
        s[1] = [uint256(123), 142, 187];
        bytes memory result = c.g(s, 1);
        uint256[3] memory decoded = abi.decode(result, (uint256[3]));
        assertEq(decoded[0], 123);
        assertEq(decoded[1], 142);
        assertEq(decoded[2], 187);
    }
}
