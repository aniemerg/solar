// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventEmitFromAForeignContractSameName.sol";

contract EventEmitFromAForeignContractSameNameTest is Test {
    D c;

    function setUp() public {
        c = new D();
    }

    function test_test() public {
        vm.expectEmit(false, false, false, true);
        emit C.E(1);
        vm.expectEmit(false, false, false, true);
        emit D.E(2);
        c.test();
    }
}
