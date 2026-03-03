// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchStructuredAndLowLevel {
    function g(bool b) public pure returns (uint256, uint256) {
        require(
            b,
            "message longer than 32 bytes 32 bytes 32 bytes 32 bytes 32 bytes 32 bytes 32 bytes"
        );
        return (1, 2);
    }

    function f(bool cond) public returns (uint256 x, uint256 y, bytes memory txt) {
        try this.g(cond) returns (uint256 a, uint256 b) {
            (x, y) = (a, b);
            txt = "success";
        } catch Error(string memory s) {
            x = 99;
            txt = bytes(s);
        } catch (bytes memory s) {
            x = 98;
            txt = s;
        }
    }
}
