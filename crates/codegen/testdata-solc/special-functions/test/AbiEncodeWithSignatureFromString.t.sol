// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeWithSignatureFromString.sol";

contract AbiEncodeWithSignatureFromStringTest {
    function test_f() public {
        AbiEncodeWithSignatureFromString c = new AbiEncodeWithSignatureFromString();
        (bytes memory r1, bytes memory r2) = c.f();
        assert(r1.length == r2.length);
        for (uint i = 0; i < r1.length; i++) {
            assert(r1[i] == r2[i]);
        }
    }
}
