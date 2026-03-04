// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DelegatecallReturnValue {
    uint256 value;

    function set(uint256 _value) external {
        value = _value;
    }

    function get() external view returns (uint256) {
        return value;
    }

    function get_delegated() external returns (bool, bytes memory) {
        return address(this).delegatecall(abi.encodeWithSignature("get()"));
    }

    function assert0() external view {
        assert(value == 0);
    }

    function assert0_delegated() external returns (bool, bytes memory) {
        return address(this).delegatecall(abi.encodeWithSignature("assert0()"));
    }
}
