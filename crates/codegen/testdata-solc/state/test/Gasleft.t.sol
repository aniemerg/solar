// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Gasleft.sol";

contract GasleftTest {
    function test_Gasleft() public {
        Gasleft c = new Gasleft();
        assert(c.f());
    }
}
