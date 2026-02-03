// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorStaticArrayArgument.sol";

contract ConstructorStaticArrayArgumentTest {
    function test_ConstructorStaticArrayArgument() public {
        uint256[3] memory input = [uint256(2), 3, 4];
        ConstructorStaticArrayArgument c = new ConstructorStaticArrayArgument(1, input);
        assert(c.a() == 1);
        assert(c.b(0) == 2);
        assert(c.b(1) == 3);
        assert(c.b(2) == 4);
    }
}
