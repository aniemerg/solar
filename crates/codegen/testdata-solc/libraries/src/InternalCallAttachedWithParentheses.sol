// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LCallParens {
    struct S {
        uint256[] data;
    }

    function f(S memory _s) internal {
        _s.data[3] += 2;
    }
}

contract InternalCallAttachedWithParentheses {
    using LCallParens for LCallParens.S;

    function f() public returns (uint256) {
        LCallParens.S memory x;
        x.data = new uint256[](7);
        x.data[3] = 8;
        (x.f)();
        return x.data[3];
    }
}
