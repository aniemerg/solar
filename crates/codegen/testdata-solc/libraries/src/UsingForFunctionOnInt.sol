// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library DDouble {
    function double(uint256 self) public returns (uint256) { return 2 * self; }
}

contract UsingForFunctionOnInt {
    using DDouble for uint256;

    function f(uint256 a) public returns (uint256) {
        return a.double();
    }
}
