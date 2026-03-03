// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchSimpleNoTuple {
    function g(bool b) public pure returns (uint256 x) {
        require(b);
        return 13;
    }

    function f(bool flag) public view returns (uint256 x) {
        try this.g(flag) returns (uint256 a) {
            x = a;
        } catch {
            x = 9;
        }
    }
}
