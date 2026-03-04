// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventEmitFromAForeignContract.sol";

contract EventEmitFromAForeignContractTest is Test {
    D c;

    function setUp() public {
        c = new D();
    }

    function test_test() public {
        vm.expectEmit(false, false, false, false);
        emit C.E();
        c.test();
    }
}
