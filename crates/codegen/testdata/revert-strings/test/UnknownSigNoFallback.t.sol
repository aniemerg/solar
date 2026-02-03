// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/UnknownSigNoFallback.sol";

contract UnknownSigNoFallbackTest is Test {
    UnknownSigNoFallback c;

    function setUp() public {
        c = new UnknownSigNoFallback();
    }

    function test_UnknownSigNoFallback() public {
        (bool ok,) = address(c).call(hex"00");
        assert(!ok);
    }
}
