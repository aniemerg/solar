// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SlotAccess {
    struct S {
        uint a;
        uint b;
    }

    mapping(uint => S) public mappingAccess;

    function data() internal view returns (S storage _data) {
        // We need to assign it from somewhere, otherwise we would
        // get an "uninitialized access" error.
        _data = mappingAccess[20];

        bytes32 slot = keccak256(abi.encode(uint(1), uint(0)));
        assembly {
            _data.slot := slot
        }
    }

    function set(uint x) public {
        data().a = x;
    }

    function get() public view returns (uint) {
        return data().a;
    }
}
