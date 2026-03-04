// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/StructMediocreStruct.sol";

contract StructMediocreStructTest is Test {
    StructMediocreStruct c;

    function setUp() public {
        c = new StructMediocreStruct();
    }

    function test_f() public {
        // f(uint256,(address)[2],uint256): 7, 0, 0, 8 -> 7, 0, 8
        StructMediocreStruct.S[2] memory s;
        s[0].c = StructMediocreStruct(address(0));
        s[1].c = StructMediocreStruct(address(0));
        (uint r1, StructMediocreStruct r2, uint r3) = c.f(7, s, 8);
        assertEq(r1, 7);
        assertEq(address(r2), address(0));
        assertEq(r3, 8);
    }
}
