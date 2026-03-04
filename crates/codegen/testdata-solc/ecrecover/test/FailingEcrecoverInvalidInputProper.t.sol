// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FailingEcrecoverInvalidInputProper.sol";

contract FailingEcrecoverInvalidInputProperTest {
    function test_FailingEcrecoverInvalidInputProper() public {
        FailingEcrecoverInvalidInputProper c = new FailingEcrecoverInvalidInputProper();
        // Invalid v=0, ecrecover should return address(0)
        assert(c.f() == address(0));
    }
}
