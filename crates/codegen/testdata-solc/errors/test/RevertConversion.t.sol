// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/RevertConversion.sol";

contract RevertConversionTest is Test {
    RevertConversion c;

    function setUp() public {
        c = new RevertConversion();
    }

    function test_RevertConversion() public {
        // f() -> FAILURE, hex"59e4d4df", 0x40, 0x80, 3, "abc", 1, 7
        uint[] memory b = new uint[](1);
        b[0] = 7;
        bytes4 sel = bytes4(keccak256("E(string,uint256[])"));
        assert(sel == bytes4(0x59e4d4df));
        vm.expectRevert(abi.encodeWithSelector(sel, "abc", b));
        c.f();
    }
}
