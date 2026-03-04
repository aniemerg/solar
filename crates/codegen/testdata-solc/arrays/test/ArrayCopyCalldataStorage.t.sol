// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyCalldataStorage.sol";

contract ArrayCopyCalldataStorageTest {
    function test_ArrayCopyCalldataStorage() public {
        ArrayCopyCalldataStorage c = new ArrayCopyCalldataStorage();

        // store(uint256[9],uint8[3][]): 21, 22, 23, 24, 25, 26, 27, 28, 29, 0x140, 4, 1, 2, 3, 11, 12, 13, 21, 22, 23, 31, 32, 33 -> 32
        uint[9] memory a = [uint(21), 22, 23, 24, 25, 26, 27, 28, 29];
        uint8[3][] memory b = new uint8[3][](4);
        b[0] = [1, 2, 3];
        b[1] = [11, 12, 13];
        b[2] = [21, 22, 23];
        b[3] = [31, 32, 33];
        uint8 ret = c.store(a, b);
        assert(ret == 32);

        // retrieve() -> 9, 28, 9, 28, 4, 3, 32
        (uint ra, uint rb, uint rc, uint rd, uint re, uint rf, uint rg) = c.retrieve();
        assert(ra == 9);
        assert(rb == 28);
        assert(rc == 9);
        assert(rd == 28);
        assert(re == 4);
        assert(rf == 3);
        assert(rg == 32);
    }
}
