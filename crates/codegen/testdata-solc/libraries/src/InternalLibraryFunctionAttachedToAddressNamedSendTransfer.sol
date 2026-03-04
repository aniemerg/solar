// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LSendTransfer {
    function transfer(address a) internal {}
    function send(address a) internal {}
}

contract InternalLibraryFunctionAttachedToAddressNamedSendTransfer {
    using LSendTransfer for address;

    function useTransfer(address a) public {
        a.transfer();
    }

    function useSend(address a) public {
        a.send();
    }
}
