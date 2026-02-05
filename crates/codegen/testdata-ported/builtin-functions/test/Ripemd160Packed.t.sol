// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Ripemd160Packed.sol";

contract Ripemd160PackedTest {
    function test_Ripemd160Packed() public {
        Ripemd160Packed c = new Ripemd160Packed();
        assert(
            c.f(4) ==
                0xf93175303eba2a7b372174fc9330237f5ad202fc000000000000000000000000
        );
        assert(
            c.f(5) ==
                0x04f4fc112e2bfbe0d38f896a46629e08e2fcfad5000000000000000000000000
        );
        assert(
            c.f(-1) ==
                0xc0a2e4b1f3ff766a9a0089e7a410391730872495000000000000000000000000
        );
    }
}
