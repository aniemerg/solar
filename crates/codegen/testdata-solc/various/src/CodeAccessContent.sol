// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodeAccessContentD {
    bytes32 public x;

    constructor() {
        bytes32 codeHash;
        assembly {
            let size := codesize()
            codecopy(mload(0x40), 0, size)
            codeHash := keccak256(mload(0x40), size)
        }
        x = codeHash;
    }
}

contract CodeAccessContent {
    function testRuntime() public returns (bool) {
        CodeAccessContentD d = new CodeAccessContentD();
        bytes32 runtimeHash = keccak256(type(CodeAccessContentD).runtimeCode);
        bytes32 otherHash;
        uint256 size;
        assembly {
            size := extcodesize(d)
            extcodecopy(d, mload(0x40), 0, size)
            otherHash := keccak256(mload(0x40), size)
        }
        require(size == type(CodeAccessContentD).runtimeCode.length);
        require(runtimeHash == otherHash);
        return true;
    }

    function testCreation() public returns (bool) {
        CodeAccessContentD d = new CodeAccessContentD();
        bytes32 creationHash = keccak256(type(CodeAccessContentD).creationCode);
        require(creationHash == d.x());
        return true;
    }
}
