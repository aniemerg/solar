// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NamedArgsOverload {
    function f() public pure returns (uint256) { return 0; }
    function f(uint256 a) public pure returns (uint256) { return a; }
    function f(uint256 a, uint256 b) public pure returns (uint256) { return a + b; }
    function f(uint256 a, uint256 b, uint256 c) public pure returns (uint256) { return a + b + c; }

    function call(uint256 num) public pure returns (uint256) {
        if (num == 0) return f();
        if (num == 1) return f({a: 1});
        if (num == 2) return f({b: 1, a: 2});
        if (num == 3) return f({c: 1, a: 2, b: 3});
        if (num == 4) return f({b: 5, c: 1, a: 2});
        return 500;
    }
}
