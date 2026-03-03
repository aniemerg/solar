// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

contract StorageBoundaryPackedArray {
    function getArray() internal pure returns (uint64[40][1] storage _x) {
        assembly {
            _x.slot := sub(0, 5)
        }
    }

    function fillArray() public {
        uint64[40][1] storage _x = getArray();
        for (uint64 i = 1; i < 40; i++)
            _x[0][i] = i;
    }

    function clearArray() public {
        uint64[40][1] storage _x = getArray();
        delete _x[0];
    }

    function x() public view returns (uint64[40] memory) {
        return getArray()[0];
    }
}
