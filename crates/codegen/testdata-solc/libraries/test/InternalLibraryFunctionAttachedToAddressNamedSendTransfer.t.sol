// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToAddressNamedSendTransfer.sol";

contract InternalLibraryFunctionAttachedToAddressNamedSendTransferTest {
    InternalLibraryFunctionAttachedToAddressNamedSendTransfer c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToAddressNamedSendTransfer();
    }

    function test_useTransfer() public {
        // useTransfer returns nothing, just check it doesn't revert
        c.useTransfer(address(0x111122223333444455556666777788889999aAaa));
    }

    function test_useSend() public {
        // useSend returns nothing, just check it doesn't revert
        c.useSend(address(0x111122223333444455556666777788889999aAaa));
    }
}
