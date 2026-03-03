// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchAssert {
    function g(bool x) public pure {
        assert(x);
    }

    function f(bool x) public returns (uint256) {
        try this.g(x) {
            return 1;
        } catch {
            return 2;
        }
    }
}
