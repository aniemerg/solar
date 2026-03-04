// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Store2.sol";

contract Store2Test {
    function test_Store2() public {
        Store2 c = new Store2();
        // run() -> FAILURE, hex"4e487b71", 0x51
        // Calling stored uninitialized function pointer panics with Panic(0x51)
        (bool success, bytes memory data) = address(c).call(abi.encodeWithSignature("run()"));
        assert(!success);
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
