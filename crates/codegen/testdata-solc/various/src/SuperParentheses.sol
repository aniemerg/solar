// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SuperParenthesesA {
    function f() public virtual returns (uint256 r) {
        return 1;
    }
}

contract SuperParenthesesB is SuperParenthesesA {
    function f() public virtual override returns (uint256 r) {
        return ((super).f)() | 2;
    }
}

contract SuperParenthesesC is SuperParenthesesA {
    function f() public virtual override returns (uint256 r) {
        return ((super).f)() | 4;
    }
}

contract SuperParentheses is SuperParenthesesB, SuperParenthesesC {
    function f() public override(SuperParenthesesB, SuperParenthesesC) returns (uint256 r) {
        return ((super).f)() | 8;
    }
}
