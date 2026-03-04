// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LPointer {
    function f() internal returns (uint256) {
        return 66;
    }
}

contract InternalLibraryFunctionPointer {
    function g() public returns (uint256) {
        function() internal returns (uint256) ptr;
        ptr = LPointer.f;
        return ptr();
    }
}
