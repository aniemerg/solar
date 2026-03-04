// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayPopParenthesized {
    int[] data;

    function f() public returns (uint) {
        data.push(1);
        (data.pop)();
        return data.length;
    }
}
