// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error CustomErrorStringMem(string);

contract RequireErrorStringMemory {
    function f() external pure {
        string memory reason = "errorReason";
        require(false, CustomErrorStringMem(reason));
    }

    function g() external pure {
        string memory reason = "anotherReason";
        require(false, CustomErrorStringMem(reason));
    }
}
