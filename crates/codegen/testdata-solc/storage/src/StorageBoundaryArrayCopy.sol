// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

contract StorageBoundaryArrayCopy {
    constructor() {
        uint256[10][1] storage _x = getX();
        _x[0] = [uint256(1), 2, 3, 4, 5, 6, 7, 8, 9, 10];
    }

    function getX() internal pure returns (uint256[10][1] storage _x) {
        assembly {
            _x.slot := sub(0, 5)
        }
    }

    function getY() internal pure returns (uint256[10][1] storage _y) {
        assembly {
            _y.slot := 5
        }
    }

    function copyXToY() public {
        uint256[10][1] storage _x = getX();
        uint256[10][1] storage _y = getY();
        _y[0] = _x[0];
    }

    function clearX() public {
        uint256[10][1] storage _x = getX();
        delete _x[0];
    }

    function copyYToX() public {
        uint256[10][1] storage _x = getX();
        uint256[10][1] storage _y = getY();
        _x[0] = _y[0];
    }

    function x() public view returns (uint256[10] memory) {
        return getX()[0];
    }

    function y() public view returns (uint256[10] memory) {
        return getY()[0];
    }
}
