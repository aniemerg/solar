// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalFunctionsCalldataToMemory {
    function g(string calldata) external pure returns (bool) { return true; }

    function main() external returns (bool) {
        function (string memory) external returns (bool) ptr = this.g;
        return ptr("testString");
    }
}
