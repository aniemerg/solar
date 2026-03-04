// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractArrayV2 {
    function f(bytes calldata x) public pure returns (ContractArrayV2[] memory) {
        return abi.decode(x, (ContractArrayV2[]));
    }
    function g() public view returns (bytes memory) {
        ContractArrayV2[] memory c = new ContractArrayV2[](3);
        c[0] = ContractArrayV2(address(0x42));
        c[1] = ContractArrayV2(address(0x21));
        c[2] = ContractArrayV2(address(0x23));
        return abi.encode(c);
    }
}
