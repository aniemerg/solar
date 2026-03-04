// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LSelectorsStruct {
    struct S { uint256 a; }
    function f(S storage s) external returns (uint256) { return s.a; }
    function g(S memory m) public returns (uint256) { return m.a; }
}

contract LibraryFunctionSelectorsStruct {
    LSelectorsStruct.S s;

    constructor() { s.a = 42; }

    function f() public returns (bool, bool, uint256) {
        uint256 s_ptr;
        assembly { s_ptr := s.slot }
        (bool success, bytes memory data) = address(LSelectorsStruct).delegatecall(abi.encodeWithSelector(LSelectorsStruct.f.selector, s_ptr));
        return (LSelectorsStruct.f.selector == bytes4(keccak256("f(LSelectorsStruct.S storage)")), success, abi.decode(data, (uint256)));
    }

    function g() public returns (bool, bool, uint256) {
        (bool success, bytes memory data) = address(LSelectorsStruct).delegatecall(abi.encodeWithSelector(LSelectorsStruct.g.selector, LSelectorsStruct.S(23)));
        return (LSelectorsStruct.g.selector == bytes4(keccak256("g(LSelectorsStruct.S)")), success, abi.decode(data, (uint256)));
    }
}
