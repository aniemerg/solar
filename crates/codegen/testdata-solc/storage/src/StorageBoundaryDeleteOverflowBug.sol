// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

contract StorageBoundaryDeleteOverflowBug {
    mapping(string => uint256[256][2**240]) m;

    function getSlot() internal view returns (uint256) {
        uint256[256][2**240] storage _x = m["v 2.2.3"];
        uint256 slot;
        assembly {
            slot := _x.slot
        }
        assert(slot == 0xffdb3f1d9f54eb0b5012935c286c508459d381405d269e01c15f4ec2826edbbf);
        return slot;
    }

    function getIndex() internal view returns (uint256) {
        uint256 slot = getSlot();
        // Pick the largest index such that `slot + 256 * index` <= `2**256 - 1`
        uint256 index = (type(uint256).max - slot) / 256;
        assert(index <= type(uint240).max);
        assert((type(uint256).max - slot + 1) % 256 != 0);
        return index;
    }

    function getArray() internal view returns (uint256[256][2**240] storage _x) {
        uint256 s = getSlot();
        assembly {
            _x.slot := s
        }
    }

    function fillArray() public {
        uint256[256][2**240] storage _x = getArray();
        for (uint i = 1; i < 256; i++)
            _x[getIndex()][i] = i;
    }

    function partialAssignArray() public {
        uint256[256][2**240] storage _x = getArray();
        _x[getIndex()] = [uint256(11), 22, 33, 44, 55, 66, 77, 88, 99];
    }

    function clearArray() public {
        uint256[256][2**240] storage _x = getArray();
        delete _x[getIndex()];
    }

    function x() public view returns (uint256[256] memory) {
        return getArray()[getIndex()];
    }
}
