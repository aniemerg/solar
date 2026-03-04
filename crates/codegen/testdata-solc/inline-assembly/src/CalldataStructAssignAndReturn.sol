// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

pragma abicoder v2;

contract CalldataStructAssignAndReturn {
    struct S { int8 x; int8 y; }
    function f() internal pure returns(S calldata s) {
        assembly {
            s := 0x24
        }
    }
    function g() public pure returns(int8, int8) {
        S calldata s = f();
        return (s.x, s.y);
    }
    function h() public pure returns(uint256) { f(); return 0x42; }
    function i() public pure returns(uint256) { abi.decode(msg.data[4:], (S)); return 0x42; }
}
