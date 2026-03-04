// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FreeFunctionResolutionBaseContractS2.sol";
contract FreeFunctionResolutionBaseContractTest is Test {
    function test_FreeFunctionResolutionBaseContract() public {
        D d = new D();
        assertEq(d.h(), 1337);
    }
}
