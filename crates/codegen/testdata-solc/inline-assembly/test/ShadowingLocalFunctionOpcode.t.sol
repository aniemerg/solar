// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ShadowingLocalFunctionOpcode.sol";

contract ShadowingLocalFunctionOpcodeTest is Test {
    ShadowingLocalFunctionOpcode c;

    function setUp() public {
        c = new ShadowingLocalFunctionOpcode();
    }

    // g() -> 7, 3
    // x uses Solidity add(1,2) which is shadowed to return 7
    // y uses assembly add(1,2) which is the EVM opcode -> 3
    function test_g() public {
        (uint x, uint y) = c.g();
        assertEq(x, 7);
        assertEq(y, 3);
    }
}
