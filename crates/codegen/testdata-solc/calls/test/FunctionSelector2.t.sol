// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionSelector2.sol";

contract FunctionSelector2Test {
    function test_FunctionSelector2() public {
        FunctionSelector2 c = new FunctionSelector2();
        (bytes4 a, bytes4 b) = c.test();
        assert(a == bytes4(keccak256("ext()")));
        assert(b == bytes4(keccak256("pub()")));
    }
}
