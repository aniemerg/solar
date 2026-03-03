// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ViaImport.sol";

contract ViaImportTest is Test {
    ViaImport c;

    function setUp() public {
        c = new ViaImport();
    }

    function test_ViaImport() public {
        // x() -> FAILURE, hex"002ff067", 1
        bytes4 sel = bytes4(keccak256("E(uint256)"));
        assert(sel == bytes4(0x002ff067));

        vm.expectRevert(abi.encodeWithSelector(sel, uint256(1)));
        c.x();

        vm.expectRevert(abi.encodeWithSelector(sel, uint256(2)));
        c.y();

        vm.expectRevert(abi.encodeWithSelector(sel, uint256(3)));
        c.z();
    }
}
