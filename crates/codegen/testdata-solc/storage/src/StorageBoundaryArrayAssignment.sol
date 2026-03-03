// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageBoundaryArrayAssignment {
    function getArray() internal pure returns (uint256[10][1] storage _x) {
        assembly {
            _x.slot := sub(0, 5)
        }
    }

    function assignArray(uint256[10] memory y) public {
        uint256[10][1] storage _x = getArray();
        _x[0] = y;
    }

    function x() public view returns (uint256[10] memory) {
        return getArray()[0];
    }
}
