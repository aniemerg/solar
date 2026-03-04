// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataArrayDynamicToStorage.sol";

contract CalldataArrayDynamicToStorageTest {
    function test_CalldataArrayDynamicToStorage() public {
        CalldataArrayDynamicToStorage c = new CalldataArrayDynamicToStorage();
        // f(uint256[]): 0x20, 0x03, 0x1, 0x2, 0x3 -> 0x1
        uint256[] memory data = new uint256[](3);
        data[0] = 1; data[1] = 2; data[2] = 3;
        uint result = c.f(data);
        assert(result == 1);
    }
}
