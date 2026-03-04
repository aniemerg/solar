// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicMultiArrayCleanup {
    struct S { uint[][] d; }
    S[] data;

    function fill() public returns (uint) {
        while (data.length < 3)
            data.push();
        while (data[2].d.length < 4)
            data[2].d.push();
        while (data[2].d[3].length < 5)
            data[2].d[3].push();
        data[2].d[3][4] = 8;
        return data[2].d[3][4];
    }
    function clear() public { delete data; }
    function getDataLength() public view returns (uint256) { return data.length; }
}
