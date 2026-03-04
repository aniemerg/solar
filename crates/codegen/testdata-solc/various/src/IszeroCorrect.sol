// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A long time ago, some opcodes were renamed, which involved the opcodes
// "iszero" and "not".
contract IszeroCorrect {
    function f() public returns (bool) {
        bytes32 x = bytes32(uint256(1));
        assembly {
            x := not(x)
        }
        if (x != ~bytes32(uint256(1))) return false;
        assembly {
            x := iszero(x)
        }
        if (x != bytes32(0)) return false;
        return true;
    }
}
