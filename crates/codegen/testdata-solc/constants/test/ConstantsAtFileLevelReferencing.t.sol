// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstantsAtFileLevelReferencing.sol";

contract ConstantsAtFileLevelReferencingTest {
    function test_ConstantsAtFileLevelReferencing() public {
        ConstantsAtFileLevelReferencing c = new ConstantsAtFileLevelReferencing();

        bytes memory fa = c.f();
        assert(fa.length == 3);
        assert(fa[0] == 0x03 && fa[1] == 0x01 && fa[2] == 0x02);

        bytes memory gb = c.g();
        assert(gb.length == 3);
        assert(gb[0] == 0x03 && gb[1] == 0x01 && gb[2] == 0x02);

        assert(c.h() == 5);

        bytes memory ic = c.i();
        assert(ic.length == 3);
        assert(ic[0] == 0x03 && ic[1] == 0x01 && ic[2] == 0x02);
    }
}
