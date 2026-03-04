// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstantStringAtFileLevel.sol";

contract ConstantStringAtFileLevelTest {
    function test_ConstantStringAtFileLevel() public {
        ConstantStringAtFileLevel c = new ConstantStringAtFileLevel();

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

        (uint xi, ActionChoices ch, bytes32 s) = c.i();
        assert(xi == 56);
        assert(ch == ActionChoices.GoRight);
        assert(s == 0x61626300ff5f5f00000000000000000000000000000000000000000000000000);
    }
}
