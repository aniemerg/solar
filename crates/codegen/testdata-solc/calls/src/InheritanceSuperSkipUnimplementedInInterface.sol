// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function f() public virtual returns (uint) {
        return 42;
    }
}

interface Iface {
    function f() external returns (uint);
}

contract InheritanceSuperSkipUnimplementedInInterface is A, Iface {
    function f() override(A, Iface) public returns (uint) {
        // Iface.f() is before A.f() in the C3 linearized order
        // but it has no implementation.
        return super.f();
    }
}
