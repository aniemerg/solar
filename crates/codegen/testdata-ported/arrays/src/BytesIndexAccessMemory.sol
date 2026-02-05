// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesIndexAccessMemory {
    function f(
        bytes memory _s1,
        uint256 i1,
        uint256 i2,
        uint256 i3
    ) public pure returns (bytes1 c1, bytes1 c2, bytes1 c3) {
        c1 = _s1[i1];
        c2 = intern(_s1, i2);
        c3 = internIndirect(_s1)[i3];
    }

    function intern(bytes memory _s1, uint256 i) public pure returns (bytes1 c) {
        return _s1[i];
    }

    function internIndirect(bytes memory _s1) public pure returns (bytes memory) {
        return _s1;
    }
}
