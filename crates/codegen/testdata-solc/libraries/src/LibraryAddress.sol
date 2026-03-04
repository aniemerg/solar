// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LAddr {
    function f(uint256 v) external pure returns (uint256) {
        return v * v;
    }
    function g(uint256 v) external returns (uint256) {
        return v * v;
    }
}

contract LibraryAddress {
    function addr() public view returns (bool) {
        return address(LAddr) == address(0);
    }
    function g(uint256 v) public view returns (uint256) {
        return LAddr.f(v);
    }
    function h(uint256 v) public returns (uint256) {
        (bool success, bytes memory result) = address(LAddr).delegatecall(abi.encodeWithSignature("f(uint256)", v));
        assert(success);
        return abi.decode(result, (uint256));
    }
    function i(uint256 v) public returns (uint256) {
        (bool success, bytes memory result) = address(LAddr).call(abi.encodeWithSignature("f(uint256)", v));
        assert(success);
        return abi.decode(result, (uint256));
    }
    function j(uint256 v) public returns (uint256) {
        (bool success, bytes memory result) = address(LAddr).delegatecall(abi.encodeWithSignature("g(uint256)", v));
        assert(success);
        return abi.decode(result, (uint256));
    }
}
