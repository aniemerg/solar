// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionUnreferenced.sol";

contract FunctionUnreferencedTest {
    function test_FunctionUnreferenced() public {
        FunctionUnreferenced c = new FunctionUnreferenced();
        // B.g.selector = bytes4(keccak256("g()"))
        assert(c.f() == bytes4(keccak256("g()")));
    }
}
