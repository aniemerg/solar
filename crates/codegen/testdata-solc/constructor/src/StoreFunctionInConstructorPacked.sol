// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StoreFunctionInConstructorPacked {
    uint16 public result_in_constructor;
    function(uint16) returns (uint16) internal x;
    uint16 public other = 0x1fff;

    constructor() {
        x = doubleInv;
        result_in_constructor = use(2);
    }

    function doubleInv(uint16 _arg) public returns (uint16 _ret) {
        _ret = ~(_arg * 2);
    }

    function use(uint16 _arg) public returns (uint16) {
        return x(_arg);
    }
}
