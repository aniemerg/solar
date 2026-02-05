// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EmptyCalldataCallsReceive.sol";

contract EmptyCalldataCallsReceiveTest is Test {
    EmptyCalldataCallsReceive c;

    function setUp() public {
        c = new EmptyCalldataCallsReceive();
    }

    function test_EmptyCalldataCallsReceive() public {
        assert(c.x() == 0);

        (bool ok1,) = address(c).call("");
        assert(ok1);
        assert(c.x() == 1);

        (bool ok2,) = address(c).call{value: 1}("");
        assert(ok2);
        assert(c.x() == 2);

        (bool ok3,) = address(c).call(abi.encodeWithSignature("x()"));
        assert(ok3);

        (bool ok4,) = address(c).call(hex"00");
        assert(!ok4);
    }
}
