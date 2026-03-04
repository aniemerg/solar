// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InvalidInConstructor.sol";

contract InvalidInConstructorTest {
    function test_InvalidInConstructor() public {
        InvalidInConstructor c = new InvalidInConstructor();
        // f() -> FAILURE, hex"4e487b71", 0x51
        // Calling uninitialized function pointer in constructor panics with Panic(0x51)
        (bool success, bytes memory data) = address(c).call(abi.encodeWithSignature("f()"));
        assert(!success);
        // Verify it's a Panic(0x51) = invalid internal function call
        assert(data.length >= 36);
        bytes4 selector;
        assembly {
            selector := mload(add(data, 32))
        }
        assert(selector == bytes4(0x4e487b71));
        uint256 code;
        assembly {
            code := mload(add(data, 36))
        }
        assert(code == 0x51);
    }
}
