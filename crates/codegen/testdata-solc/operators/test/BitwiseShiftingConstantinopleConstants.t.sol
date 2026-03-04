// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BitwiseShiftingConstantinopleConstants.sol";

contract BitwiseShiftingConstantinopleConstantsTest {
    function test_BitwiseShiftingConstantinopleConstants() public {
        C c = new C();
        assert(c.shl_1() == true);
        assert(c.shl_2() == true);
        assert(c.shl_3() == true);
        assert(c.shr_1() == true);
        assert(c.shr_2() == true);
        assert(c.shr_3() == true);
    }
}
