// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/ArrayOfStructCalldataToMemory.sol";

contract ArrayOfStructCalldataToMemoryTest {
    function test_ArrayOfStructCalldataToMemory() public {
        ArrayOfStructCalldataToMemory c = new ArrayOfStructCalldataToMemory();

        // f((uint128,uint64,uint128)[3]): 0, 0, 12, 0, 11, 0, 10, 0, 0 -> 10, 11, 12
        // 3 structs: S(0,0,12), S(0,11,0), S(10,0,0)
        ArrayOfStructCalldataToMemory.S[3] memory sf;
        sf[0] = ArrayOfStructCalldataToMemory.S(0, 0, 12);
        sf[1] = ArrayOfStructCalldataToMemory.S(0, 11, 0);
        sf[2] = ArrayOfStructCalldataToMemory.S(10, 0, 0);
        (uint128 fa, uint64 fb, uint128 fc) = c.f(sf);
        assert(fa == 10);
        assert(fb == 11);
        assert(fc == 12);

        // g((uint128,uint64,uint128)[]): 0x20, 3, 0, 0, 12, 0, 11, 0, 10, 0, 0 -> 10, 11, 12
        ArrayOfStructCalldataToMemory.S[] memory sg = new ArrayOfStructCalldataToMemory.S[](3);
        sg[0] = ArrayOfStructCalldataToMemory.S(0, 0, 12);
        sg[1] = ArrayOfStructCalldataToMemory.S(0, 11, 0);
        sg[2] = ArrayOfStructCalldataToMemory.S(10, 0, 0);
        (uint128 ga, uint64 gb, uint128 gc) = c.g(sg);
        assert(ga == 10);
        assert(gb == 11);
        assert(gc == 12);
    }
}
