// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LUnattached {
    function f() internal returns (uint256) {
        return 3;
    }
}

contract InternalCallUnattachedWithParentheses {
    function foo() public returns (uint256) {
        return (LUnattached.f)();
    }
}
