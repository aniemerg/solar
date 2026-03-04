// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IndexedLogTopicDuringExplicitDowncast {
    function f() public pure returns (uint32 y) {
        uint8 x = uint8(uint256(0x31313131313131313131313131313131));
        assembly { y := x }
    }

    function g() public pure returns (bytes32 y) {
        bytes1 x = bytes1(bytes16(0x31313131313131313131313131313131));
        assembly { y := x }
    }

    function h() external pure returns (bytes32 y) {
        bytes1 x;
        assembly { x := sub(0,1) }
        y = x;
    }
}
