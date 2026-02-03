// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionSelector1.sol";

contract FunctionSelector1Test {
    function test_FunctionSelector1() public {
        FunctionSelector1 c = new FunctionSelector1();
        (bytes4 a, bytes4 b, bytes4 csel, bytes4 d) = c.test();
        bytes4 extSel = bytes4(keccak256("ext()"));
        bytes4 pubSel = bytes4(keccak256("pub()"));
        assert(a == extSel);
        assert(b == pubSel);
        assert(csel == extSel);
        assert(d == pubSel);
    }
}
