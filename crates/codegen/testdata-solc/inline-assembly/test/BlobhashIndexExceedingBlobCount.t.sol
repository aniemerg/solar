// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/BlobhashIndexExceedingBlobCount.sol";

contract BlobhashIndexExceedingBlobCountTest is Test {
    BlobhashIndexExceedingBlobCount c;

    function setUp() public {
        c = new BlobhashIndexExceedingBlobCount();
    }

    // f() -> 0x00 (blobhash with index >= blob count returns 0)
    // In Foundry test environment there are no blobs, so blobhash(2) returns 0
    function test_f() public {
        assertEq(c.f(), bytes32(0));
    }
}
