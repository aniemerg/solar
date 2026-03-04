// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FreeFunctionResolutionOverrideVirtualSuperS2.sol";
contract FreeFunctionResolutionOverrideVirtualSuperTest is Test {
    function test_FreeFunctionResolutionOverrideVirtualSuper() public {
        D d = new D();
        assertEq(d.g(), 1337);
    }
}
