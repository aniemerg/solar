// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataWithGarbage.sol";

contract CalldataWithGarbageTest is Test {
    CalldataWithGarbage c;

    function setUp() public {
        c = new CalldataWithGarbage();
    }

    // The garbage tests use non-standard calldata where the array offset points
    // past some garbage words. We test with clean standard calldata.

    function test_f_memory_empty() public {
        // f_memory with empty array
        uint[] memory a = new uint[](0);
        uint[] memory result = c.f_memory(a);
        assertEq(result.length, 0);
    }

    function test_f_memory_one_elem() public {
        // f_memory with 1 element
        uint[] memory a = new uint[](1);
        a[0] = 7;
        uint[] memory result = c.f_memory(a);
        assertEq(result.length, 1);
        assertEq(result[0], 7);
    }

    function test_f_memory_too_short_reverts() public {
        // f_memory with mismatched length -> FAILURE
        bytes memory callData = abi.encodePacked(
            CalldataWithGarbage.f_memory.selector,
            uint256(0x80),   // offset pointing past 3 garbage words
            uint256(9), uint256(9), uint256(9),  // garbage
            uint256(2),      // array length = 2
            uint256(7)       // only 1 element
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f_encode_empty() public {
        uint[] memory a = new uint[](0);
        bytes memory result = c.f_encode(a);
        uint[] memory decoded = abi.decode(result, (uint[]));
        assertEq(decoded.length, 0);
    }

    function test_f_index() public {
        uint[] memory a = new uint[](2);
        a[0] = 7; a[1] = 8;
        assertEq(c.f_index(a, 0), 7);
        assertEq(c.f_index(a, 1), 8);
    }

    function test_f_index_oob_reverts() public {
        uint[] memory a = new uint[](2);
        a[0] = 7; a[1] = 8;
        vm.expectRevert();
        c.f_index(a, 2);
    }

    function test_g_memory() public {
        uint[] memory a = new uint[](0);
        uint[2] memory b = [uint(1), 2];
        (uint[] memory retA, uint[2] memory retB) = c.g_memory(a, b);
        assertEq(retA.length, 0);
        assertEq(retB[0], 1);
        assertEq(retB[1], 2);
    }
}
