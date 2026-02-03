// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FallbackReturnData.sol";

contract FallbackReturnDataTest {
    FallbackReturnData c;

    function setUp() public {
        c = new FallbackReturnData();
    }

    function test_FallbackReturnData() public {
        (bool ok, bytes memory ret) = c.f();
        assert(ok);
        assert(keccak256(ret) == keccak256(bytes("abc")));
    }
}
