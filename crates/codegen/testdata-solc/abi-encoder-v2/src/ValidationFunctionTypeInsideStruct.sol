// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ValidationFunctionTypeInsideStruct {
    struct S { function () external x; }
    function f(S memory) public pure returns (uint r) { r = 1; }
    function g(S calldata) external pure returns (uint r) { r = 2; }
    function h(S calldata s) external pure returns (uint r) { s.x; r = 3; }
}
