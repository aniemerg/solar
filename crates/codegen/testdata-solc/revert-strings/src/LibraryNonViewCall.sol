// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library L {
    function g() external {}
}

contract LibraryNonViewCall {
    function f() public returns (bytes memory) {
        (bool success, bytes memory result) = address(L).call(abi.encodeWithSignature("g()"));
        assert(!success);
        return result;
    }
}
