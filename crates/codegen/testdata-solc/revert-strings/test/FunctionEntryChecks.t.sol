// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/FunctionEntryChecks.sol";

contract FunctionEntryChecksTest is Test {
    FunctionEntryChecks c;

    function setUp() public {
        c = new FunctionEntryChecks();
    }

    function test_FunctionEntryChecks_TooShort() public {
        // Sending selector only (no argument data) for t(uint256) -> FAILURE (calldata too short)
        bytes memory payload = abi.encodePacked(bytes4(keccak256("t(uint256)")));
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
