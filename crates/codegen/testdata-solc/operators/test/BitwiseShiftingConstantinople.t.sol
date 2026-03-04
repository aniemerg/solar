// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BitwiseShiftingConstantinople.sol";

contract BitwiseShiftingConstantinopleTest {
    function test_BitwiseShiftingConstantinople() public {
        C c = new C();
        assert(c.shl(0x01, 0x02) == 0x04);
        assert(c.shl(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x01) == 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe);
        assert(c.shl(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x100) == 0x00);
        assert(c.shr(0x03, 0x01) == 0x01);
        assert(c.shr(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x01) == 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        assert(c.shr(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xff) == 0x01);
        assert(c.shr(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x100) == 0x00);
        assert(c.sar(0x03, 0x01) == 0x01);
        // sar of all-ones stays all-ones (arithmetic right shift preserves sign)
        assert(c.sar(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x01) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        assert(c.sar(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xff) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        assert(c.sar(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x100) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
    }
}
