// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayZeroedMemoryIndexAccess.sol";

contract ArrayZeroedMemoryIndexAccessTest {
    function test_ArrayZeroedMemoryIndexAccess() public {
        ArrayZeroedMemoryIndexAccess c = new ArrayZeroedMemoryIndexAccess();
        string memory key = "01234567890123456789012345678901";

        assert(c.set(key, 5, 0) == 0);
        assert(c.set(key, 5, 1) == 0);
        assert(c.set(key, 5, 4) == 0);

        bytes4 selector;
        uint256 code;
        try c.set(key, 5, 5) {
            assert(false);
        } catch (bytes memory data) {
            assembly {
                selector := mload(add(data, 32))
                code := mload(add(data, 36))
            }
        }
        assert(selector == bytes4(0x4e487b71));
        assert(code == 0x32);
    }
}
