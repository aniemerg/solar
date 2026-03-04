// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Failure {
    function e() public pure {
        revert("Transaction failed.");
    }

    function f(bool _value) public pure {
        string memory message;
        require(_value, message);
    }

    function g(bool _value) public pure {
        require(_value, "Value is false.");
    }

    function h() public pure returns (uint) {
        assert(false);
    }
}
