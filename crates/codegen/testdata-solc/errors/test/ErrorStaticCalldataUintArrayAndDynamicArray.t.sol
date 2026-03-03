// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ErrorStaticCalldataUintArrayAndDynamicArray.sol";

contract ErrorStaticCalldataUintArrayAndDynamicArrayTest is Test {
    ErrorStaticCalldataUintArrayAndDynamicArray c;

    function setUp() public {
        c = new ErrorStaticCalldataUintArrayAndDynamicArray();
    }

    function test_ErrorStaticCalldataUintArrayAndDynamicArray() public {
        // f(uint256[],uint256[1]): 0x40, 0xff, 1, 0xffff
        // -> FAILURE, hex"f42f106d", 0x40, 0xff, 1, 0xffff
        uint[] memory a = new uint[](1);
        a[0] = 0xff;
        uint[1] memory b = [uint(0xffff)];

        // Build expected revert data: selector + abi-encoded (uint[], uint[1])
        // The revert encodes E(a, b) which is E(uint[], uint[1])
        bytes4 selector = bytes4(keccak256("E(uint256[],uint256[1])"));
        bytes memory expected = abi.encodeWithSelector(selector, a, b);
        vm.expectRevert(expected);
        c.f(a, b);
    }
}
