// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FixedArrayCleanup {
    uint spacer1;
    uint spacer2;
    uint[20] data;

    function fill() public {
        for (uint i = 0; i < data.length; ++i) data[i] = i + 1;
    }
    function clear() public { delete data; }
    function get(uint i) public view returns (uint) { return data[i]; }
}
