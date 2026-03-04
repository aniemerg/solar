// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TransientStateVariableSlotInlineAssembly {
    uint256 y;
    uint256 transient x;
    int8 transient w;
    int z;
    address transient a;
    function f() public pure returns (uint256 s, uint256 o) {
        assembly {
            s := x.slot
            o := x.offset
        }
    }
    function g() public pure returns (uint256 s, uint256 o) {
        assembly {
            s := w.slot
            o := w.offset
        }
    }
    function h() public pure returns (uint256 s, uint256 o) {
        assembly {
            s := a.slot
            o := a.offset
        }
    }
}
