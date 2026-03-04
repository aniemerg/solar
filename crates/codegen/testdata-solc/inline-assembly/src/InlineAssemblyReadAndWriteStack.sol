// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyReadAndWriteStack {
    function f() public returns (uint256 r) {
        for (uint256 x = 0; x < 10; ++x)
            assembly {
                r := add(r, x)
            }
    }
}
