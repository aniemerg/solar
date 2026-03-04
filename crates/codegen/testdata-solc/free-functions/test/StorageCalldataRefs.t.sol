// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageCalldataRefs.sol";

contract StorageCalldataRefsTest {
    function test_StorageCalldataRefs() public {
        StorageCalldataRefs c = new StorageCalldataRefs();
        uint[] memory input = new uint[](3);
        input[0] = 8;
        input[1] = 9;
        input[2] = 10;
        (uint a, uint b) = c.f(7, input);
        // data[0] = 7 (returned as 'a'), input[1] = 9 (returned as 'b')
        assert(a == 7 && b == 9);
    }
}
