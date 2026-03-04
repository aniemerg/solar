// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract A {
    function f(uint256[] calldata a) external virtual returns (uint256[] calldata);
}

contract B is A {
    function f(uint256[] memory a) public override returns (uint256[] memory) {
        return a;
    }

    function g(uint256[] calldata x) public returns (uint256[] memory) {
        return f(x);
    }
}
