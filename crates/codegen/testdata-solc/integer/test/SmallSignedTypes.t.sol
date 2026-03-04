// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SmallSignedTypes.sol";

contract SmallSignedTypesTest {
    function test_SmallSignedTypes() public {
        SmallSignedTypes c = new SmallSignedTypes();
        assert(c.run() == 200);
    }
}
