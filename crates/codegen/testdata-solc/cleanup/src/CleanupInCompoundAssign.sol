// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanupInCompoundAssign {
    function test() public pure returns (uint256, uint256) {
        uint32 a = 0xffffffff;
        uint16 x = uint16(a);
        uint16 y = x;
        x /= 0x100;
        y = y / 0x100;
        return (x, y);
    }
}
