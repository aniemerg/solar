// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ConstantVarAsArrayLength.sol";

contract ConstantVarAsArrayLengthTest is Test {
    function test_ConstantVarAsArrayLength() public {
        uint256[3] memory init = [uint256(1), uint256(2), uint256(3)];
        ConstantVarAsArrayLength c = new ConstantVarAsArrayLength(init);
        assertEq(c.a(0), 1);
        assertEq(c.a(1), 2);
        assertEq(c.a(2), 3);
    }
}
