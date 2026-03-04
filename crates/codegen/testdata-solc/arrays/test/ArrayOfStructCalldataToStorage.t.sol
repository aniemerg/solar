// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/ArrayOfStructCalldataToStorage.sol";

contract ArrayOfStructCalldataToStorageTest {
    function test_ArrayOfStructCalldataToStorage() public {
        ArrayOfStructCalldataToStorage c = new ArrayOfStructCalldataToStorage();

        // f((uint128,uint64,uint128)[]): 0x20, 3, 0, 0, 12, 0, 11, 0, 10, 0, 0 -> 10, 11, 12
        ArrayOfStructCalldataToStorage.S[] memory inp = new ArrayOfStructCalldataToStorage.S[](3);
        inp[0] = ArrayOfStructCalldataToStorage.S(0, 0, 12);
        inp[1] = ArrayOfStructCalldataToStorage.S(0, 11, 0);
        inp[2] = ArrayOfStructCalldataToStorage.S(10, 0, 0);
        (uint128 a, uint64 b, uint128 cc) = c.f(inp);
        assert(a == 10);
        assert(b == 11);
        assert(cc == 12);
    }
}
