// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicArraysInStorage {
    struct Data {
        uint256 x;
        uint256 y;
    }
    Data[] data;
    uint256[] ids;

    function setIDStatic(uint256 id) public {
        ids[2] = id;
    }

    function setID(uint256 index, uint256 id) public {
        ids[index] = id;
    }

    function setData(uint256 index, uint256 x, uint256 y) public {
        data[index].x = x;
        data[index].y = y;
    }

    function getID(uint256 index) public returns (uint256) {
        return ids[index];
    }

    function getData(uint256 index) public returns (uint256 x, uint256 y) {
        x = data[index].x;
        y = data[index].y;
    }

    function getLengths() public returns (uint256 l1, uint256 l2) {
        l1 = data.length;
        l2 = ids.length;
    }

    function setLengths(uint256 l1, uint256 l2) public {
        while (data.length < l1) data.push();
        while (ids.length < l2) ids.push();
    }
}
