// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Tests that high-level calls to nonexistent contracts revert
// because of extcodesize check (legacy bytecode).

interface I {
    function a() external pure;
    function b() external;
    function c() external payable;
    function x() external returns (uint);
    function y() external returns (string memory);
}

contract ExternalCallToNonexisting {
    I i = I(address(0xcafecafe));
    constructor() payable {}

    function f(uint c) external returns (uint) {
        if (c == 0) i.a();
        else if (c == 1) i.b();
        else if (c == 2) i.c();
        else if (c == 3) i.c{value: 1}();
        else if (c == 4) i.x();
        else if (c == 5) i.y();
        return 1 + c;
    }
}
