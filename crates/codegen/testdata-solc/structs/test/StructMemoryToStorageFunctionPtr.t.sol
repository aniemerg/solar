// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructMemoryToStorageFunctionPtr.sol";

contract StructMemoryToStorageFunctionPtrTest {
    StructMemoryToStorageFunctionPtr c;

    function setUp() public {
        c = new StructMemoryToStorageFunctionPtr();
    }

    function test_StructMemoryToStorageFunctionPtr() public {
        (uint32 a, uint128 b, uint256 cc, uint32 fa, uint32 fb) = c.f();
        assert(a == 42 && b == 23 && cc == 34 && fa == 42 && fb == 42);
    }
}
