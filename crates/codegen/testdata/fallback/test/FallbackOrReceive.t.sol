// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/FallbackOrReceive.sol";

contract FallbackOrReceiveTest is Test {
    FallbackOrReceive c;

    function setUp() public {
        c = new FallbackOrReceive();
        vm.deal(address(this), 2 ether);
    }

    function test_FallbackOrReceive() public {
        (uint256 x, uint256 y) = c.f();
        assert(x == 0 && y == 0);

        (bool ok1,) = address(c).call("");
        assert(ok1);
        (x, y) = c.f();
        assert(x == 0 && y == 1);

        (bool ok2,) = address(c).call{value: 1 ether}("");
        assert(ok2);
        (x, y) = c.f();
        assert(x == 0 && y == 2);

        (bool ok3,) = address(c).call(hex"01");
        assert(ok3);
        (x, y) = c.f();
        assert(x == 1 && y == 2);

        (bool ok4,) = address(c).call{value: 1 ether}(hex"01");
        assert(ok4);
        (x, y) = c.f();
        assert(x == 2 && y == 2);
    }
}
