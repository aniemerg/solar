// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UncalledAddressTransferSend.sol";

contract UncalledAddressTransferSendTest {
    function test_fCompiles() public {
        UncalledAddressTransferSend c = new UncalledAddressTransferSend();
        c.f();
    }
}
