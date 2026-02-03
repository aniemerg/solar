// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/NamedErrorArgs.sol";

contract NamedErrorArgsTest is Test {
    NamedErrorArgs c;

    function setUp() public {
        c = new NamedErrorArgs();
    }

    function test_NamedErrorArgs() public {
        vm.expectRevert(abi.encodeWithSelector(ENamed.selector, 2, 7));
        c.f();
    }
}
