// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodeAccessCreateD {
    uint256 x;

    constructor() {
        x = 7;
    }

    function f() public view returns (uint256) {
        return x;
    }
}

contract CodeAccessCreate {
    function test() public returns (uint256) {
        bytes memory c = type(CodeAccessCreateD).creationCode;
        CodeAccessCreateD d;
        assembly {
            d := create(0, add(c, 0x20), mload(c))
        }
        return d.f();
    }
}
