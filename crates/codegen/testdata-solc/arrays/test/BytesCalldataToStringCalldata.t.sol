// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesCalldataToStringCalldata.sol";

contract BytesCalldataToStringCalldataTest {
    function test_BytesCalldataToStringCalldata() public {
        BytesCalldataToStringCalldata c = new BytesCalldataToStringCalldata();
        // f(bytes): 0x20, 3, "abc" -> 0x20, 3, "abc"
        bytes memory inp = "abc";
        string memory result = c.f(inp);
        assert(keccak256(bytes(result)) == keccak256(inp));
    }
}
