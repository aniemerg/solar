// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LSelectors {
    function f(uint256 x) external returns (uint256) { return x; }
    function g(uint256[] storage s) external returns (uint256) { return s.length; }
    function h(uint256[] memory m) public returns (uint256) { return m.length; }
}

contract LibraryFunctionSelectors {
    uint256[] s;

    constructor() { while (s.length < 42) s.push(0); }

    function f() public returns (bool, bool, uint256) {
        (bool success, bytes memory data) = address(LSelectors).delegatecall(abi.encodeWithSelector(LSelectors.f.selector, 7));
        return (LSelectors.f.selector == bytes4(keccak256("f(uint256)")), success, abi.decode(data, (uint256)));
    }

    function g() public returns (bool, bool, uint256) {
        uint256 s_ptr;
        assembly { s_ptr := s.slot }
        (bool success, bytes memory data) = address(LSelectors).delegatecall(abi.encodeWithSelector(LSelectors.g.selector, s_ptr));
        return (LSelectors.g.selector == bytes4(keccak256("g(uint256[] storage)")), success, abi.decode(data, (uint256)));
    }

    function h() public returns (bool, bool, uint256) {
        (bool success, bytes memory data) = address(LSelectors).delegatecall(abi.encodeWithSelector(LSelectors.h.selector, new uint256[](23)));
        return (LSelectors.h.selector == bytes4(keccak256("h(uint256[])")), success, abi.decode(data, (uint256)));
    }
}
