// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

function copy(uint dstOffset, uint srcOffset, uint length) pure returns (bytes memory out) {
    out =
        hex"2222222222222222333333333333333344444444444444445555555555555555"
        hex"6666666666666666777777777777777788888888888888889999999999999999"
        hex"aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbccccccccccccccccdddddddddddddddd";
    assembly {
        mcopy(add(add(out, 0x20), dstOffset), add(add(out, 0x20), srcOffset), length)
    }
}

contract McopyOverlap {
    function mcopy_to_right_overlap() public pure returns (bytes memory) {
        return copy(0x20, 0x10, 0x30);
    }

    function mcopy_to_left_overlap() public pure returns (bytes memory) {
        return copy(0x10, 0x20, 0x30);
    }

    function mcopy_in_place() public pure returns (bytes memory) {
        return copy(0x10, 0x10, 0x40);
    }

    function mcopy_to_right_no_overlap() public pure returns (bytes memory) {
        return copy(0x30, 0x10, 0x20);
    }

    function mcopy_to_left_no_overlap() public pure returns (bytes memory) {
        return copy(0x10, 0x30, 0x20);
    }
}
