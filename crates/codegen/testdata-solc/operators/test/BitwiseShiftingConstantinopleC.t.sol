// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BitwiseShiftingConstantinopleC.sol";

contract BitwiseShiftingConstantinopleCSol {
    function test_BitwiseShiftingConstantinopleC() public {
        C c = new C();
        assert(c.shl_zero(0x00) == 0x00);
        assert(c.shl_zero(0xffff) == 0xffff);
        assert(c.shl_zero(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        assert(c.shr_zero(0x00) == 0x00);
        assert(c.shr_zero(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        assert(c.sar_zero(0x00) == 0x00);
        assert(c.sar_zero(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        assert(c.shl_large(0x00) == 0x00);
        assert(c.shl_large(0xffff) == 0x00);
        assert(c.shl_large(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0x00);
        assert(c.shr_large(0x00) == 0x00);
        assert(c.shr_large(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0x00);
        assert(c.sar_large(0x00) == 0x00);
        assert(c.sar_large(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0x00);
        assert(c.sar_large(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        assert(c.shl_combined(0x00) == 0x00);
        assert(c.shl_combined(0xffff) == 0xffff0000);
        assert(c.shl_combined(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000);
        assert(c.shr_combined(0x00) == 0x00);
        assert(c.shr_combined(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        assert(c.sar_combined(0x00) == 0x00);
        assert(c.sar_combined(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        assert(c.sar_combined(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        assert(c.shl_combined_large(0x00) == 0x00);
        assert(c.shl_combined_large(0xffff) == 0x00);
        assert(c.shl_combined_large(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0x00);
        assert(c.shl_combined_overflow(0x02) == 0x00);
        assert(c.shr_combined_large(0x00) == 0x00);
        assert(c.shr_combined_large(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0x00);
        assert(c.shr_combined_overflow(0x02) == 0x00);
        assert(c.sar_combined_large(0x00) == 0x00);
        assert(c.sar_combined_large(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0x00);
        assert(c.sar_combined_large(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
    }
}
