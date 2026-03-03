// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchPanic {
    function uf(bool b, uint256 x, uint256 y) public pure returns (uint256) {
        require(b, "failure");
        return x - y;
    }

    function onlyPanic(bool b, uint256 x, uint256 y) public returns (uint256 r, uint256 code) {
        try this.uf(b, x, y) returns (uint256 bb) {
            r = bb;
        } catch Panic(uint256 c) {
            code = c;
        }
    }

    function panicAndError(
        bool b,
        uint256 x,
        uint256 y
    ) public returns (uint256 r, uint256 code, string memory msg_) {
        try this.uf(b, x, y) returns (uint256 bb) {
            r = bb;
        } catch Panic(uint256 c) {
            code = c;
        } catch Error(string memory _errmsg) {
            msg_ = _errmsg;
        }
    }
}
