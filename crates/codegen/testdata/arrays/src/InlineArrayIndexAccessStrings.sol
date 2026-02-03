// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineArrayIndexAccessStrings {
    string public tester;

    function f() public pure returns (string memory) {
        return (["abc", "def", "g"][0]);
    }

    function test() public {
        tester = f();
    }
}
