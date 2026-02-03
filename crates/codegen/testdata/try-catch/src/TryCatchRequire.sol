// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchRequire {
    function g(bool x) public pure {
        require(x);
    }

    function f(bool x) public returns (uint256) {
        try this.g(x) {
            return 1;
        } catch {
            return 2;
        }
    }
}
