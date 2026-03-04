// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TupleAssignMultiSlotGrow {
    function f() public pure returns (uint, uint, uint) {
        bytes memory a; bytes memory b; bytes memory c;
        (a, (b, c)) = ("0", ("1", "2"));
        return (uint8(a[0]), uint8(b[0]), uint8(c[0]));
    }
}
