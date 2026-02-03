// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RequireErrorEvaluationOrder3.sol";

contract RequireErrorEvaluationOrder3Test {
    function test_RequireErrorEvaluationOrder3() public {
        RequireErrorEvaluationOrder3 c = new RequireErrorEvaluationOrder3();
        string memory reason = "";
        bool didRevert = false;

        try c.f(false) {
            didRevert = false;
        } catch Error(string memory message) {
            didRevert = true;
            reason = message;
        }

        assert(didRevert);
        assert(keccak256(bytes(reason)) == keccak256(bytes("Intercepted failure message")));

        c.f(true);
    }
}
