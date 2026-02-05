// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CallOptionsOverload.sol";

contract CallOptionsOverloadTest is Test {
    CallOptionsOverload c;

    function setUp() public {
        c = new CallOptionsOverload();
        vm.deal(address(this), 1 ether);
    }

    function test_CallOptionsOverload() public {
        (bool ok,) = address(c).call{value: 1 ether}("");
        assert(ok);
        (uint256 v, uint256 x, uint256 y, uint256 z) = c.call();
        assert(v == 1);
        assert(x == 2);
        assert(y == 2);
        assert(z == 2);
        assert(c.bal() == 1 ether);
    }
}
