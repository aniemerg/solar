// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ViaContractType.sol";

contract ViaContractTypeTest is Test {
    ViaContractType c;

    function setUp() public {
        c = new ViaContractType();
    }

    function test_ViaContractType() public {
        // f() -> FAILURE, hex"002ff067", 1
        // E(uint) selector = keccak256("E(uint256)")[0:4] = 0x002ff067
        bytes4 euintSel = bytes4(keccak256("E(uint256)"));
        assert(euintSel == bytes4(0x002ff067));

        vm.expectRevert(abi.encodeWithSelector(euintSel, uint256(1)));
        c.f();

        vm.expectRevert(abi.encodeWithSelector(euintSel, uint256(1)));
        c.g();

        // h() -> FAILURE, hex"3e9992c9", "abc"
        bytes4 estrSel = bytes4(keccak256("E(string)"));
        assert(estrSel == bytes4(0x3e9992c9));
        vm.expectRevert(abi.encodeWithSelector(estrSel, "abc"));
        c.h();
    }
}
