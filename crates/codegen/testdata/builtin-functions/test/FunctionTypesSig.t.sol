// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionTypesSig.sol";

contract FunctionTypesSigTest {
    function test_FunctionTypesSig() public {
        FunctionTypesSig c = new FunctionTypesSig();
        bytes4 fsel = bytes4(keccak256("f()"));
        bytes4 xsel = bytes4(keccak256("x()"));
        assert(c.f() == fsel);
        assert(c.g() == fsel);
        assert(c.h() == fsel);
        assert(c.i() == xsel);
    }
}
