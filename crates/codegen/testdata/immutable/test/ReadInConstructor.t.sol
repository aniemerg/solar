// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ReadInConstructor.sol";

contract ReadInConstructorTest {
    function test_ReadInConstructor() public {
        ReadInConstructor c = new ReadInConstructor();
        assert(c.readX() == 3);
    }
}
