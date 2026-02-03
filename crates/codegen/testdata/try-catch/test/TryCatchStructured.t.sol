// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchStructured.sol";

contract TryCatchStructuredTest {
    function test_TryCatchStructured() public {
        TryCatchStructured c = new TryCatchStructured();
        (uint256 a, uint256 b, string memory txt) = c.f(true);
        assert(a == 1);
        assert(b == 2);
        assert(keccak256(bytes(txt)) == keccak256(bytes("success")));

        (a, b, txt) = c.f(false);
        assert(a == 0);
        assert(b == 0);
        assert(keccak256(bytes(txt)) == keccak256(bytes("message")));
    }
}
