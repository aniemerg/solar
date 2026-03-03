// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    enum Choice { A, B, C }
}

contract UsingInheritedEnumExplicitly is Base {
    function answer() public pure returns (Base.Choice _ret) {
        _ret = Base.Choice.B;
    }
}
