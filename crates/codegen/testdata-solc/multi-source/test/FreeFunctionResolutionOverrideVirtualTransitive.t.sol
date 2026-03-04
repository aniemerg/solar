// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FreeFunctionResolutionOverrideVirtualTransitiveS3.sol";
contract FreeFunctionResolutionOverrideVirtualTransitiveTest is Test {
    function test_FreeFunctionResolutionOverrideVirtualTransitive() public {
        E e = new E();
        // C.g=1337, D.g=super.g()+1=1338, E.g=super.g()+1=1339
        assertEq(e.g(), 1339);
    }
}
