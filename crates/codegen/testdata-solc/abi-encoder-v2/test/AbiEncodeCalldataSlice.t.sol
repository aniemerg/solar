// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/AbiEncodeCalldataSlice.sol";

contract AbiEncodeCalldataSliceTest is Test {
    AbiEncodeCalldataSlice c;

    function setUp() public {
        c = new AbiEncodeCalldataSlice();
    }

    function test_test_bytes() public {
        // test_bytes() ->
        c.test_bytes();
    }

    function test_test_uint256() public {
        // test_uint256() ->
        c.test_uint256();
    }
}
