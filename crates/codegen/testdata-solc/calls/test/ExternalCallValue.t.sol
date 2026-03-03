// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ExternalCallValue.sol";

contract ExternalCallValueTest is Test {
    ExternalCallValue c;

    function setUp() public {
        c = new ExternalCallValue();
        vm.deal(address(this), 12 ether);
    }

    function test_ExternalCallValue_g() public {
        (uint256 a, uint256 b) = c.g{value: 1 ether}(4);
        assert(a == 1 ether * 1000);
        assert(b == 4);
    }

    function test_ExternalCallValue_f() public {
        (uint256 a, uint256 b) = c.f{value: 11 ether}(2);
        assert(a == 10000);
        assert(b == 2);
    }
}
