// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PredictionExample.sol";

contract PredictionExampleTest {
    function test_PredictionExample() public {
        PredictionExample c = new PredictionExample();
        // createDSalted(42, 64) -> (no return, requires address match internally)
        c.createDSalted(bytes32(uint256(42)), 64);
    }
}
