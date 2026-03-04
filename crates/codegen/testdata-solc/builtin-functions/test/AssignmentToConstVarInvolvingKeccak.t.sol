// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AssignmentToConstVarInvolvingKeccak.sol";

contract AssignmentToConstVarInvolvingKeccakTest {
    function test_AssignmentToConstVarInvolvingKeccak() public {
        AssignmentToConstVarInvolvingKeccak c = new AssignmentToConstVarInvolvingKeccak();
        assert(c.f() == 0x4e03657aea45a94fc7d47ba826c8d667c0d1e6e33a64a036ec44f58fa12d6c45);
    }
}
