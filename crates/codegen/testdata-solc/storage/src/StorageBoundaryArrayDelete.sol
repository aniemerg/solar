// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

contract StorageBoundaryArrayDelete {
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

    function clearArray() public {
        uint256[10][1] storage _x = getArray();
        delete _x[0];
    }

    function x() public view returns (uint256[10] memory) {
        return getArray()[0];
    }
}
