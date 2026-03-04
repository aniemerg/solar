// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TernaryOperatorWithLiteralTypesOverflow.sol";

contract TernaryOperatorWithLiteralTypesOverflowTest {
    TernaryOperatorWithLiteralTypesOverflow c;

    function setUp() public {
        c = new TernaryOperatorWithLiteralTypesOverflow();
    }

    function test_g_reverts() public {
        (bool ok,) = address(c).call(abi.encodeWithSignature("g()"));
        assert(!ok);
    }

    function test_h_reverts() public {
        (bool ok,) = address(c).call(abi.encodeWithSignature("h()"));
        assert(!ok);
    }
}
