// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function f() public virtual returns (uint) {
        return 42;
    }
}

abstract contract Iface {
    function f() external virtual returns (uint);
}

contract InheritanceSuperSkipUnimplementedInAbstractContract is A, Iface {
    function f() override(A, Iface) public returns (uint) {
        // I.f() is before A.f() in the C3 linearized order
        // but it has no implementation.
        return super.f();
    }
}
