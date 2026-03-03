// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

contract StorageBoundaryArrayPartialAssignment {
    function getArray() internal pure returns (uint256[10][1] storage _x) {
        assembly {
            _x.slot := sub(0, 5)
        }
    }

    function fillArray() public {
        uint256[10][1] storage _x = getArray();
        for (uint i = 1; i < 10; i++)
            _x[0][i] = i;
    }

    function x() public view returns (uint256[10] memory) {
        return getArray()[0];
    }

    function partialAssignArrayBeforeStorageBoundary() public {
        uint256[10][1] storage _x = getArray();
        _x[0] = [uint256(21), 22, 23];
    }

    function partialAssignArrayCrossStorageBoundary() public {
        uint256[10][1] storage _x = getArray();
        _x[0] = [uint256(11), 12, 13, 14, 15, 16, 17];
    }
}
