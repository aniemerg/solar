// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Chainid.sol";

contract ChainidTest is Test {
    Chainid c;

    function setUp() public {
        c = new Chainid();
    }

    // f() -> chain id (31337 in Foundry by default)
    function test_f() public {
        uint id = c.f();
        assertEq(id, block.chainid);
    }
}
