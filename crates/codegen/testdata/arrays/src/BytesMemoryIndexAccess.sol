// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesMemoryIndexAccess {
    function set(bytes memory _data, uint256 i) public pure returns (uint256 l, bytes1 c) {
        l = _data.length;
        c = _data[i];
    }
}
