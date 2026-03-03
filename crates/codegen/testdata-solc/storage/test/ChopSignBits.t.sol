// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ChopSignBits.sol";

contract ChopSignBitsTest {
    ChopSignBits c;

    function setUp() public {
        c = new ChopSignBits();
    }

    function test_ChopSignBits() public {
        assert(c.x(0) == -1);
        assert(c.x(1) == -2);
        assert(c.y(0) == -5);
        assert(c.y(1) == -6);

        int16[] memory res = c.f();
        assert(res.length == 2);
        assert(res[0] == -3);
        assert(res[1] == -4);

        int16[2] memory gres = c.g();
        assert(gres[0] == -3);
        assert(gres[1] == -4);

        int16 hres = c.h(-10);
        assert(hres == -10);
    }
}
