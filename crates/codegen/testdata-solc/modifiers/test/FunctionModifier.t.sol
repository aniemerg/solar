// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/FunctionModifier.sol";

contract FunctionModifierTest is Test {
    FunctionModifier c;

    function setUp() public {
        c = new FunctionModifier();
    }

    function test_FunctionModifier_NoValue() public {
        assert(c.getOne() == 0);
    }

    function test_FunctionModifier_WithValue() public {
        (bool ok, bytes memory data) = address(c).call{value: 1}(abi.encodeWithSignature("getOne()"));
        assert(ok);
        uint256 r = abi.decode(data, (uint256));
        assert(r == 1);
    }
}
