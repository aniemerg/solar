// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ErrorThrowFromModuleViaMemberAccess.sol";

contract ErrorThrowFromModuleViaMemberAccessTest is Test {
    ErrorThrowFromModuleViaMemberAccess c;

    function setUp() public {
        c = new ErrorThrowFromModuleViaMemberAccess();
    }

    function test_ErrorThrowFromModuleViaMemberAccess() public {
        // error1() -> FAILURE, hex"a5f9ec67", 0x20, 7, "B error"
        // ErrorB(string) selector = keccak256("ErrorB(string)")[0:4]
        bytes4 errorBSel = bytes4(keccak256("ErrorB(string)"));
        vm.expectRevert(abi.encodeWithSelector(errorBSel, "B error"));
        c.error1();

        // error2() -> FAILURE, hex"a5f9ec67", 0x20, 17, "B.BContract error"
        // BContract.ErrorB(string) has same selector as ErrorB(string)
        vm.expectRevert(abi.encodeWithSelector(errorBSel, "B.BContract error"));
        c.error2();

        // error3() -> FAILURE, hex"23b0db14", 0x20, 9, "B.A error"
        // ErrorA(string) selector = keccak256("ErrorA(string)")[0:4]
        bytes4 errorASel = bytes4(keccak256("ErrorA(string)"));
        vm.expectRevert(abi.encodeWithSelector(errorASel, "B.A error"));
        c.error3();
    }
}
