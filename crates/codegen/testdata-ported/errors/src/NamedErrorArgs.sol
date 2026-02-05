// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error ENamed(uint256 a, uint256 b);

contract NamedErrorArgs {
    function f() public pure {
        revert ENamed({b: 7, a: 2});
    }
}
