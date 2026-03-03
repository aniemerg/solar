// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/PanicViaImport.sol";

contract PanicViaImportTest is Test {
    PanicViaImport c;

    function setUp() public {
        c = new PanicViaImport();
    }

    function test_PanicViaImport() public {
        // a() -> FAILURE, hex"002ff067", 1
        bytes4 sel = bytes4(0x002ff067);
        assert(sel == bytes4(keccak256("E(uint256)")));

        vm.expectRevert(abi.encodeWithSelector(sel, uint256(1)));
        c.a();

        vm.expectRevert(abi.encodeWithSelector(sel, uint256(1)));
        c.b();
    }
}
