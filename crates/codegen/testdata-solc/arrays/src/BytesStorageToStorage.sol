// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesStorageToStorage {
    bytes a;
    bytes b;
    function f(uint len) public returns (bytes memory) {
        bytes memory x = new bytes(len);
        for (uint i = 0; i < len; i++)
            x[i] = bytes1(uint8(i));
        a = x;
        for (uint i = 0; i < len; i++)
            assert(a[i] == x[i]);
        b = a;
        for (uint i = 0; i < len; i++)
            assert(b[i] == x[i]);
        return b;
    }
}
