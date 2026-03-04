// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalFunctionPointerAddress {
    function testFunction() external {}

    function testYul() public returns (address adr) {
        function() external fp = ExternalFunctionPointerAddress(address(0x1234)).testFunction;

        assembly {
            adr := fp.address
        }
    }
    function testSol() public returns (address) {
        return ExternalFunctionPointerAddress(address(0x1234)).testFunction.address;
    }
}
