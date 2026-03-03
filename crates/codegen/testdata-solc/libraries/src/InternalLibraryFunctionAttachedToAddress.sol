// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LAddressEq {
    function equals(address a, address b) internal pure returns (bool) {
        return a == b;
    }
}

contract InternalLibraryFunctionAttachedToAddress {
    using LAddressEq for address;

    function foo(address a, address b) public pure returns (bool) {
        return a.equals(b);
    }
}
