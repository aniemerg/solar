// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FreeFunctionResolutionOverrideVirtualS2.sol";
contract FreeFunctionResolutionOverrideVirtualTest is Test {
    function test_FreeFunctionResolutionOverrideVirtual() public {
        D d = new D();
        assertEq(d.g(), 1337);
    }
}
