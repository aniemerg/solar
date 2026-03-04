// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Selfbalance.sol";

contract SelfbalanceTest is Test {
    Selfbalance c;

    function setUp() public {
        c = new Selfbalance();
    }

    // f(), 254 wei -> 254
    function test_f() public {
        uint ret = c.f{value: 254}();
        assertEq(ret, 254);
    }
}
