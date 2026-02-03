// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftRight.sol";

contract ShiftRightTest {
    function test_ShiftRight() public {
        ShiftRight c = new ShiftRight();
        assert(c.f(0x4266, 0x0) == 0x4266);
        assert(c.f(0x4266, 0x8) == 0x42);
        assert(c.f(0x4266, 0x10) == 0x0);
        assert(c.f(0x4266, 0x11) == 0x0);
        assert(
            c.f(57896044618658097711785492504343953926634992332820282019728792003956564819968, 5) ==
                1809251394333065553493296640760748560207343510400633813116524750123642650624
        );
    }
}
