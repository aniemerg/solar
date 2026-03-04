// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeCallSpecialArgs.sol";

contract AbiEncodeCallSpecialArgsTest {
    AbiEncodeCallSpecialArgs c;

    function setUp() public {
        c = new AbiEncodeCallSpecialArgs();
    }

    function test_AbiEncodeCallSpecialArgs() public view {
        c.assertConsistentSelectors();
    }
}
