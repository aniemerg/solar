// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TransientFunctionTypeStateVariable {
    function () external transient f;
    function g() external {
    }

    function test() public returns (bool) {
        assert(f != this.g);
        f = this.g;

        return f == this.g;
    }
}
