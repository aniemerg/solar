// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UncalledAddressTransferSend {
    fallback() external payable {
        // This used to cause an ICE
        payable(this).transfer;
    }

    function f() pure public {}
}
