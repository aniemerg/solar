// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DuplicatedFunctionDefinition {
    function a() internal pure {}
    function f() public {
        function() ptr1 = a;
        function() ptr2 = a;
    }
}
