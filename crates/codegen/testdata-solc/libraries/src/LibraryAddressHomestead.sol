// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LHomestead {
    function f(uint256 a, uint256 b) external {
        assert(a * a == b);
    }
}

contract LibraryAddressHomestead {
    function addr() public view returns (bool) {
        return address(LHomestead) == address(0);
    }
    function g(uint256 a, uint256 b) public returns (bool) {
        (bool success,) = address(LHomestead).delegatecall(abi.encodeWithSignature("f(uint256,uint256)", a, b));
        return success;
    }
}
