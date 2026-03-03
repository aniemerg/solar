// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RevertReturnArea.sol";

contract RevertReturnAreaTest {
    function test_RevertReturnArea() public {
        RevertReturnArea c = new RevertReturnArea();
        // call returns 0 (failure), and mload(0) has the first 32 bytes of the revert data
        // The revert data starts with Error(string) selector: 0x08c379a0...
        (uint s, uint r) = c.f();
        assert(s == 0);
        // The call overwrites memory[0..32] with the first 32 bytes of returndata
        // which is the 4-byte Error selector padded: 0x08c379a0 << 224
        assert(r == uint(bytes32(hex"08c379a000000000000000000000000000000000000000000000000000000000")));
    }
}
