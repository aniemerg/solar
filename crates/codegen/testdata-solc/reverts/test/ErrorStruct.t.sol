// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ErrorStruct.sol";

contract ErrorStructTest is Test {
    ErrorStruct c;

    function setUp() public {
        c = new ErrorStruct();
    }

    function test_f() public {
        // f() reverts with custom error test() selector 0xf8a8fd6d
        vm.expectRevert(abi.encodeWithSelector(bytes4(0xf8a8fd6d)));
        c.f();
    }

    function test_g() public {
        assert(c.g(7) == 7);
    }
}
