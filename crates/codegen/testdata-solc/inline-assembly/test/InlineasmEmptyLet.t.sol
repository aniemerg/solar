// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineasmEmptyLet.sol";

contract InlineasmEmptyLetTest is Test {
    InlineasmEmptyLet c;

    function setUp() public {
        c = new InlineasmEmptyLet();
    }

    // f() -> 0, 0
    function test_f() public {
        (uint a, uint b) = c.f();
        assertEq(a, 0);
        assertEq(b, 0);
    }
}
