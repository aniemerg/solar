// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InheritanceCallBaseBaseExplicitRoot {
    function f(uint n) public virtual returns (uint) {
        return 2 * n;
    }

    function s(uint n) public returns (uint) {
        return 4 * n;
    }
}

contract InheritanceCallBaseBaseExplicitMid is InheritanceCallBaseBaseExplicitRoot {
    function f(uint n) public virtual override returns (uint) {
        return 3 * n;
    }
}

contract InheritanceCallBaseBaseExplicit is InheritanceCallBaseBaseExplicitMid {
    function g(uint n) public returns (uint) {
        // calling base-base function of a virtual overridden function.
        return InheritanceCallBaseBaseExplicitRoot.f(n);
    }

    function k(uint n) public returns (uint) {
        // Calling base-base function of a non-virtual function.
        return InheritanceCallBaseBaseExplicitRoot.s(n);
    }
}
