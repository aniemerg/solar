// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EmptyString.sol";

contract EmptyStringTest {
    function test_EmptyString() public {
        EmptyString c = new EmptyString();
        assert(keccak256(bytes(c.f())) == keccak256(bytes("")));
    }
}
