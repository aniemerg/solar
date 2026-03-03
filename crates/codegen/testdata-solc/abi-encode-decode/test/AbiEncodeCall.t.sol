// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeCall.sol";

contract AbiEncodeCallTest {
    AbiEncodeCall c;

    function setUp() public {
        c = new AbiEncodeCall();
    }

    function test_AbiEncodeCall() public {
        assert(c.callExternal() == true);
    }
}
