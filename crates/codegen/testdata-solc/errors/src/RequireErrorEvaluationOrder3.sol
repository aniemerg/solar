// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RequireErrorEvaluationOrder3 {
    string failureMessage = "Failure Message";

    function g(bool x) internal returns (bool) {
        failureMessage = "Intercepted failure message";
        return x;
    }

    function h() internal view returns (string memory) {
        return failureMessage;
    }

    function f(bool c) public {
        require(g(c), h());
    }
}
