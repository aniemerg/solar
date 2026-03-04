// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstantString.sol";

contract ConstantStringTest {
    function test_ConstantString() public {
        ConstantString c = new ConstantString();

        bytes memory fa = c.f();
        assert(fa.length == 3);
        assert(fa[0] == 0x03 && fa[1] == 0x01 && fa[2] == 0x02);

        bytes memory gb = c.g();
        assert(gb.length == 3);
        assert(gb[0] == 0x03 && gb[1] == 0x01 && gb[2] == 0x02);

        bytes memory hc = c.h();
        assert(hc.length == 5);
        assert(
            hc[0] == "h" && hc[1] == "e" && hc[2] == "l" && hc[3] == "l" && hc[4] == "o"
        );
    }
}
