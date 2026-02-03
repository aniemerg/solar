// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchLowLevel {
    function g(bool b) public pure returns (uint256, uint256) {
        require(b, "message");
        return (1, 2);
    }

    function f(bool b) public returns (uint256 x, uint256 y, bytes memory txt) {
        try this.g(b) returns (uint256 a, uint256 bb) {
            (x, y) = (a, bb);
        } catch (bytes memory s) {
            txt = s;
        }
    }
}
