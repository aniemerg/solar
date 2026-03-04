// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AddressCodeComplex.sol";

contract AddressCodeComplexTest {
    AddressCodeComplex c;

    function setUp() public {
        c = new AddressCodeComplex();
    }

    function test_g_code_length() public {
        // The constructor stores 0x48aa5566000000 (7 bytes) and returns 32 bytes
        // The deployed code is 32 bytes
        assert(c.g() == 0x20);
    }

    function test_f_code_content() public {
        bytes memory code = c.f();
        assert(code.length == 0x20);
        // mstore stores 0x48aa5566000000 as a 32-byte word right-aligned.
        // So the value is stored in bytes 25..31: code[25]=0x48, code[26]=0xaa, etc.
        assert(code[25] == 0x48);
        assert(code[26] == 0xaa);
        assert(code[27] == 0x55);
        assert(code[28] == 0x66);
    }
}
