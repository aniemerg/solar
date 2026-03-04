// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/Multiline.sol";

contract MultilineTest is Test {
    function test_Multiline_f() public {
        Multiline c = new Multiline();
        assert(c.f(1, 1, 1, 1, 1) == 5);
    }

    function test_Multiline_g_nonexistent() public {
        // g() does not exist - calling it should revert (FAILURE)
        Multiline c = new Multiline();
        (bool ok,) = address(c).call(abi.encodeWithSignature("g()"));
        assert(!ok);
    }
}
