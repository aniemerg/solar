// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UsingContractEnumsWithExplicitContractName {
    enum Choice { A, B, C }

    function answer() public pure returns (UsingContractEnumsWithExplicitContractName.Choice _ret) {
        _ret = UsingContractEnumsWithExplicitContractName.Choice.B;
    }
}
