// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicArrayCleanup {
    uint[20] spacer;
    uint[] dynamic;

    function fill() public {
        for (uint i = 0; i < 21; ++i)
            dynamic.push(i + 1);
    }
    function halfClear() public {
        while (dynamic.length > 5)
            dynamic.pop();
    }
    function fullClear() public { delete dynamic; }
    function getLength() public view returns (uint256) { return dynamic.length; }
    function get(uint256 i) public view returns (uint256) { return dynamic[i]; }
}
