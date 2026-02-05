// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Array2dZeroedMemoryIndexAccess.sol";

contract Array2dZeroedMemoryIndexAccessTest {
    function assertPanic(bytes memory data, uint256 code) internal pure {
        bytes4 selector;
        uint256 value;
        assembly {
            selector := mload(add(data, 32))
            value := mload(add(data, 36))
        }
        assert(selector == bytes4(0x4e487b71));
        assert(value == code);
    }

    function test_Array2dZeroedMemoryIndexAccess() public {
        Array2dZeroedMemoryIndexAccess c = new Array2dZeroedMemoryIndexAccess();
        string memory key = "01234567890123456789012345678901";

        assert(c.set(key, 2, 4, 0, 0) == 0);
        assert(c.set(key, 2, 4, 1, 3) == 0);

        try c.set(key, 2, 4, 3, 3) {
            assert(false);
        } catch (bytes memory data) {
            assertPanic(data, 0x32);
        }

        try c.set(key, 2, 4, 1, 5) {
            assert(false);
        } catch (bytes memory data) {
            assertPanic(data, 0x32);
        }
    }
}
