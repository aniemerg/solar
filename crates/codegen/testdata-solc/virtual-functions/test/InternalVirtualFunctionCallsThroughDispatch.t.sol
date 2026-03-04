// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalVirtualFunctionCallsThroughDispatch.sol";

contract InternalVirtualFunctionCallsThroughDispatchTest {
    function test_InternalVirtualFunctionCallsThroughDispatch() public {
        Derived c = new Derived();
        // h() -> 2
        assert(c.h() == 2);
    }
}
