// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/IndexAccess.sol";

contract IndexAccessTest {
    function test_IndexAccess() public {
        IndexAccess c = new IndexAccess();

        bytes memory zero = c.toLittleEndian64(0);
        assert(keccak256(zero) == keccak256(hex"0000000000000000"));

        bytes memory swapped = c.toLittleEndian64(0x0102030405060708);
        assert(keccak256(swapped) == keccak256(hex"0807060504030201"));
    }
}
