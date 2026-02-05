// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayStaticReturnParamZeroedMemory.sol";

contract ArrayStaticReturnParamZeroedMemoryTest {
    function test_ArrayStaticReturnParamZeroedMemory() public {
        ArrayStaticReturnParamZeroedMemory c = new ArrayStaticReturnParamZeroedMemory();
        (uint256[3] memory x, uint256[2] memory y, uint256[] memory z, uint256 t) =
            c.set("01234567890123456789012345678901");
        assert(x[0] == 0 && x[1] == 0 && x[2] == 0);
        assert(y[0] == 0 && y[1] == 0);
        assert(z.length == 0);
        assert(t == 0);
    }
}
