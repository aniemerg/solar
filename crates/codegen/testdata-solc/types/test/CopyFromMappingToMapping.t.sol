// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyFromMappingToMapping.sol";

contract CopyFromMappingToMappingTest {
    CopyFromMappingToMapping c;

    function setUp() public {
        c = new CopyFromMappingToMapping();
    }

    function test_f() public {
        // f() -> S{x:[7,8,9], y:[[3,4],[3,4]], z:13}
        CopyFromMappingToMapping.S memory s = c.f();
        assert(s.x[0] == 7);
        assert(s.x[1] == 8);
        assert(s.x[2] == 9);
        assert(s.z == 13);
        assert(s.y.length == 2);
        assert(s.y[0].length == 2);
        assert(s.y[0][0] == 3);
        assert(s.y[0][1] == 4);
        assert(s.y[1].length == 2);
        assert(s.y[1][0] == 3);
        assert(s.y[1][1] == 4);
    }
}
