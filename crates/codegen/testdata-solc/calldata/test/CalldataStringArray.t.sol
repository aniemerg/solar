// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStringArray.sol";

contract CalldataStringArrayTest {
    CalldataStringArray c;

    function setUp() public {
        c = new CalldataStringArray();
    }

    function test_CalldataStringArray() public view {
        string[] memory a = new string[](1);
        a[0] = "ab";
        (uint256 arrLen, uint256 strLen, uint256 firstByte, string memory s) = c.f(a);
        assert(arrLen == 1);
        assert(strLen == 2);
        assert(firstByte == 97); // 'a' = 0x61 = 97
        assert(keccak256(bytes(s)) == keccak256(bytes("ab")));
    }
}
