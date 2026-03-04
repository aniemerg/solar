// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeCallDeclaration.sol";

contract AbiEncodeCallDeclarationTest {
    AbiEncodeCallDeclaration c;

    function setUp() public {
        c = new AbiEncodeCallDeclaration();
    }

    function test_AbiEncodeCallDeclaration() public view {
        assert(c.run() == 11116);
    }
}
