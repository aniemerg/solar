// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FailingEcrecoverInvalidInput.sol";

contract FailingEcrecoverInvalidInputTest {
    function test_FailingEcrecoverInvalidInput() public {
        FailingEcrecoverInvalidInput c = new FailingEcrecoverInvalidInput();
        // Invalid v=1, should return address(0)
        assert(c.f() == address(0));
    }
}
