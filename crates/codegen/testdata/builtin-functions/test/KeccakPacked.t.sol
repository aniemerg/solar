// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/KeccakPacked.sol";

contract KeccakPackedTest {
    function test_KeccakPacked() public {
        KeccakPacked c = new KeccakPacked();
        assert(
            c.f(4) ==
                0xd270285b9966fefc715561efcd09d5b6a8deb15596f7c53cb4a1bb73aa55ac3a
        );
        assert(
            c.f(5) ==
                0xf2f92566c5653600c1e527a7073e5d881576d12bb51887c0b8f3e1f81865b03d
        );
        assert(
            c.f(-1) ==
                0xbc78b45e0db67af5af72e4ab62757c67aefa7388cdf0c4e74f8b5fe9dd5d9d13
        );
    }
}
