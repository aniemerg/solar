// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToArrayNamedPopPush.sol";

contract InternalLibraryFunctionAttachedToArrayNamedPopPushTest {
    InternalLibraryFunctionAttachedToArrayNamedPopPush c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToArrayNamedPopPush();
    }

    function test_InternalLibraryFunctionAttachedToArrayNamedPopPush() public {
        c.test();
    }
}
