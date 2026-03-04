// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Calldata1dArrayInto2dMemoryArrayElement.sol";

contract Calldata1dArrayInto2dMemoryArrayElementTest {
    function test_Calldata1dArrayInto2dMemoryArrayElement() public {
        Calldata1dArrayInto2dMemoryArrayElement c = new Calldata1dArrayInto2dMemoryArrayElement();
        // test() -> true
        assert(c.runTest() == true);
    }
}
