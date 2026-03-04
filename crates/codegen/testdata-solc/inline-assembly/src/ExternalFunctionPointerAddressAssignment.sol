// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalFunctionPointerAddressAssignment {
    function testFunction() external {}

    function testYul(address newAddress) view public returns (address adr) {
        function() external fp = this.testFunction;

        assembly {
            fp.address := newAddress
        }

        return fp.address;
    }
}
