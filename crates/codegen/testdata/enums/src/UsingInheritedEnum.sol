// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BaseEnum {
    enum Choice { A, B, C }
}

contract UsingInheritedEnum is BaseEnum {
    function answer() public pure returns (Choice _ret) {
        _ret = Choice.B;
    }
}
