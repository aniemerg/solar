// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchStructured {
    function g(bool b) public pure returns (uint256, uint256) {
        require(b, "message");
        return (1, 2);
    }

    function f(bool b) public returns (uint256 x, uint256 y, string memory txt) {
        try this.g(b) returns (uint256 a, uint256 bb) {
            (x, y) = (a, bb);
            txt = "success";
        } catch Error(string memory s) {
            txt = s;
        }
    }
}
