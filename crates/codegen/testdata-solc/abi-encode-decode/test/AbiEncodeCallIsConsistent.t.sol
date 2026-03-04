// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeCallIsConsistent.sol";

contract AbiEncodeCallIsConsistentTest {
    AbiEncodeCallIsConsistent c;

    function setUp() public {
        c = new AbiEncodeCallIsConsistent();
    }

    function test_AbiEncodeCallIsConsistent() public {
        c.assertConsistentSelectors();
    }
}
