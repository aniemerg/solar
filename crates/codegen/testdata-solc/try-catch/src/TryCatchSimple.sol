// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchSimple {
    function g(bool b) public pure returns (uint256 x, uint256 y) {
        require(b);
        return (1, 2);
    }

    function f(bool flag) public view returns (uint256 x, uint256 y) {
        try this.g(flag) returns (uint256 a, uint256 b) {
            (x, y) = (a, b);
        } catch {
            (x, y) = (9, 10);
        }
    }
}
