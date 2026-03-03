// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayArrayStatic.sol";

contract ArrayArrayStaticTest {
    function test_ArrayArrayStatic() public {
        ArrayArrayStatic c = new ArrayArrayStatic();
        string memory key = "01234567890123456789012345678901";

        assert(c.set(key, 2, 0) == 0);
        assert(c.set(key, 2, 1) == 0);

        bytes4 selector;
        uint256 code;
        try c.set(key, 2, 2) {
            assert(false);
        } catch (bytes memory data) {
            assembly {
                selector := mload(add(data, 32))
                code := mload(add(data, 36))
            }
        }
        assert(selector == bytes4(0x4e487b71));
        assert(code == 0x32);

        assert(c.set(key, 200, 199) == 0);
    }
}
