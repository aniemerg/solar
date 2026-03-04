// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConsecutiveOperatorInvocations.sol";

contract ConsecutiveOperatorInvocationsTest {
    function test_ConsecutiveOperatorInvocations() public {
        C c = new C();
        assert(A.unwrap(c.g()) == 0x9999999999999999999999999999999999999999);
    }
}
