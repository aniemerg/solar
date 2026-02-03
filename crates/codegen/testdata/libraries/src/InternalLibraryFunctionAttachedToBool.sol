// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LBool {
    function xor(bool a, bool b) internal pure returns (bool) {
        return a != b;
    }
}

contract InternalLibraryFunctionAttachedToBool {
    using LBool for bool;

    function foo(bool a, bool b) public pure returns (bool) {
        return a.xor(b);
    }
}
