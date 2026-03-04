// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/TransientStateEnum.sol";

contract TransientStateEnumTest {
    function test_TransientStateEnum() public {
        TransientStateEnum c = new TransientStateEnum();
        c.f();
    }
}
