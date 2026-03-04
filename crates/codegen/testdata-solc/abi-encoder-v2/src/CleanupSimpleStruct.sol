// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanupSimpleStruct {
    struct S { uint8 a; bytes1 b; }
    function gg(S calldata s) external pure returns (bytes memory) {
        s.a; s.b; // only this will validate.
        return msg.data;
    }
    function f(uint256 a, bytes32 b) public returns (bytes memory) {
        S memory s = S(2, 0x02);
        assembly {
            mstore(s, a)
            mstore(add(s, 0x20), b)
        }
        return this.gg(s);
    }
}
