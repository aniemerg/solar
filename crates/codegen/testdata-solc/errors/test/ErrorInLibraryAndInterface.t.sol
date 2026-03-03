// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ErrorInLibraryAndInterface.sol";

contract ErrorInLibraryAndInterfaceTest is Test {
    ErrorInLibraryAndInterface c;

    function setUp() public {
        c = new ErrorInLibraryAndInterface();
    }

    function test_ErrorInLibraryAndInterface() public {
        // f() reverts with E(1) - selector 0x002ff067
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x002ff067), uint(1)));
        c.f();

        // g() reverts with L.E(1,2) - selector 0x85208890
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x85208890), uint(1), uint(2)));
        c.g();

        // h() reverts with I.E(1,2,3) - selector 0x7924ea7c
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x7924ea7c), uint(1), uint(2), uint(3)));
        c.h();
    }
}
