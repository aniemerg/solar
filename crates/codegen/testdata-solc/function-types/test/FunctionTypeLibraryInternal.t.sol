// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionTypeLibraryInternal.sol";

contract FunctionTypeLibraryInternalTest {
    function test_reduce() public {
        FunctionTypeLibraryInternal c = new FunctionTypeLibraryInternal();
        uint256[] memory arr = new uint256[](3);
        arr[0] = 1;
        arr[1] = 7;
        arr[2] = 3;
        assert(c.f(arr) == 11);
    }
}
