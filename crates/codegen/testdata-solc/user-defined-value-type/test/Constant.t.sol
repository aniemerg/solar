// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Constant.sol";

contract ConstantTest {
    function test_constants() public {
        Constant c = new Constant();
        int224 expected = int224(165521356710917456517261742455526507355687727119203895813322792776);
        assert(T.unwrap(c.s()) == expected);
        assert(T.unwrap(c.t()) == expected);
        assert(c.u() == expected);
    }
}
