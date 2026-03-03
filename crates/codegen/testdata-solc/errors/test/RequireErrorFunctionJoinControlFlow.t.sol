// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/RequireErrorFunctionJoinControlFlow.sol";

contract RequireErrorFunctionJoinControlFlowTest is Test {
    RequireErrorFunctionJoinControlFlow c;

    function setUp() public {
        c = new RequireErrorFunctionJoinControlFlow();
    }

    function test_RequireErrorFunctionJoinControlFlow() public {
        // f(bool): true -> 0x15, 0x15, 0
        (uint256 a, uint256 b, uint256 z) = c.f(true);
        assert(a == 0x15 && b == 0x15 && z == 0);

        // f(bool): false -> FAILURE, hex"002ff067", 21
        // After first call: x=21, y=21 (42/2=21)
        // Second call: y is now 21, not 42, so we go to else branch
        // require(false, E(21)) -> revert with E(21)
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x002ff067), uint256(21)));
        c.f(false);
    }
}
