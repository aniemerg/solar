// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LPayable {
    function f() public returns (uint256) { return 7; }
}

contract PayableFunctionCallsLibrary {
    function f() public payable returns (uint256) {
        return LPayable.f();
    }
}
