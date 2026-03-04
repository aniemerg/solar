// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SameConstantsDifferentFiles.sol";

contract SameConstantsDifferentFilesTest {
    function test_SameConstantsDifferentFiles() public {
        SameConstantsDifferentFiles c = new SameConstantsDifferentFiles();
        (uint r0, uint r1, uint r2, uint r3) = c.f();
        // a=13 (local), fre()=89 (from helper), M.a=89, b=89
        assert(r0 == 0x0d);
        assert(r1 == 0x59);
        assert(r2 == 0x59);
        assert(r3 == 0x59);
    }
}
