// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageStorageStaticSimple.sol";

contract ArrayCopyStorageStorageStaticSimpleTest {
    function test_ArrayCopyStorageStorageStaticSimple() public {
        ArrayCopyStorageStorageStaticSimple c = new ArrayCopyStorageStorageStaticSimple();
        // test() -> left(0x01), left(0x02)
        // bytes1(1) stored as bytes2 -> left-aligned: 0x0100
        (bytes2 a, bytes2 b) = c.runTest();
        assert(a == bytes2(bytes1(0x01)));
        assert(b == bytes2(bytes1(0x02)));
    }
}
