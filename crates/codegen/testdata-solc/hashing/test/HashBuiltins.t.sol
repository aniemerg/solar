// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/HashBuiltins.sol";

contract HashBuiltinsTest {
    function test_KeccakEmpty() public {
        HashBuiltins c = new HashBuiltins();
        assert(
            c.keccakEmpty() ==
                0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470
        );
    }

    function test_Sha256Empty() public {
        HashBuiltins c = new HashBuiltins();
        assert(
            c.sha256Empty() ==
                0xe3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
        );
    }

    function test_Ripemd160Empty() public {
        HashBuiltins c = new HashBuiltins();
        assert(c.ripemd160Empty() == bytes20(hex"9c1185a5c5e9fc54612808977ee8f548b2258d31"));
    }

    function test_KeccakBytes() public {
        HashBuiltins c = new HashBuiltins();
        assert(c.keccakBytes() == true);
    }
}
