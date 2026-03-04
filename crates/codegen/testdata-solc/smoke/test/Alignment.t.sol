// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Alignment.sol";

contract AlignmentTest {
    function test_Alignment() public {
        Alignment d = new Alignment();

        assert(d.stateBool() == true);
        assert(d.stateDecimal() == 42);
        assert(d.stateBytes() == bytes32(0x4200ef0000000000000000000000000000000000000000000000000000000000));

        assert(d.internalStateDecimal() == 0x20);

        (bool b, uint256 dec, bytes32 byt) = d.update(false, uint256(int256(-23)), bytes32(0x2300ef0000000000000000000000000000000000000000000000000000000000));
        assert(b == false);
        assert(dec == uint256(int256(-23)));
        assert(byt == bytes32(0x2300ef0000000000000000000000000000000000000000000000000000000000));
    }
}
