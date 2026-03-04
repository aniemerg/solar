// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructToStorage.sol";

contract CalldataStructToStorageTest {
    CalldataStructToStorage c;

    function setUp() public {
        c = new CalldataStructToStorage();
    }

    function test_CalldataStructToStorage() public {
        CalldataStructToStorage.S memory s;
        s.a = 42;
        s.b = 23;
        s.c = "ab";
        (uint256 a, uint256 b, bytes1 cb) = c.f(1, s, 1);
        assert(a == 42 && b == 23 && cb == bytes1("b"));
    }
}
