// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractArray {
    function f(bytes calldata x) public pure returns (ContractArray[] memory) {
        return abi.decode(x, (ContractArray[]));
    }
    function g() public view returns (bytes memory) {
        ContractArray[] memory c = new ContractArray[](3);
        c[0] = ContractArray(address(0x42));
        c[1] = ContractArray(address(0x21));
        c[2] = ContractArray(address(0x23));
        return abi.encode(c);
    }
}
