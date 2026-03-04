// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodeAccessRuntimeD {
    uint256 x;

    constructor() {
        x = 7;
    }

    function f() public view returns (uint256) {
        return x;
    }
}

contract CodeAccessRuntime {
    function test() public returns (uint256) {
        CodeAccessRuntimeD d = new CodeAccessRuntimeD();
        bytes32 hash;
        assembly {
            hash := extcodehash(d)
        }
        assert(hash == keccak256(type(CodeAccessRuntimeD).runtimeCode));
        return 42;
    }
}
