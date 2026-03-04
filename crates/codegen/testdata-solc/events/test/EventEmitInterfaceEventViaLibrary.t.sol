// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventEmitInterfaceEventViaLibrary.sol";

contract EventEmitInterfaceEventViaLibraryTest is Test {
    EventEmitInterfaceEventViaLibrary c;

    function setUp() public {
        c = new EventEmitInterfaceEventViaLibrary();
    }

    function test_g() public {
        vm.expectEmit(false, false, false, false);
        emit I.E();
        c.g();
    }
}
