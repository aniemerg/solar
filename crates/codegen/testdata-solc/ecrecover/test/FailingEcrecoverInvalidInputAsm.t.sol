// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FailingEcrecoverInvalidInputAsm.sol";

contract FailingEcrecoverInvalidInputAsmTest {
    function test_FailingEcrecoverInvalidInputAsm() public {
        FailingEcrecoverInvalidInputAsm c = new FailingEcrecoverInvalidInputAsm();
        // Invalid v=0, ecrecover should return address(0)
        assert(c.f() == address(0));
    }
}
