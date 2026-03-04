// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/OperatorParameterAndReturnCleanupBetweenCalls.sol";

contract OperatorParameterAndReturnCleanupBetweenCallsTest {
    function test_OperatorParameterAndReturnCleanupBetweenCalls() public {
        C c = new C();
        // divAddNoOverflow(4, 0xff, 3): b+c = 0xff+3 = 0x102, cleaned to uint8 = 2, then 4/2 = 2
        // But dirty add: 0xff + 3 = 0x102 (garbled), div(4, 0x102) = 0 since 4 < 258
        assert(U8.unwrap(c.divAddNoOverflow(U8.wrap(4), U8.wrap(0xff), U8.wrap(3))) == 0);
    }
}
