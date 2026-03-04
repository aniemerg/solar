// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InheritanceCallBaseBaseRoot {
    function f(uint n) public virtual returns (uint) {
        return 2 * n;
    }

    function s(uint n) public returns (uint) {
        return 4 * n;
    }
}

contract InheritanceCallBaseBaseMid is InheritanceCallBaseBaseRoot {
    function f(uint n) public virtual override returns (uint) {
        return 3 * n;
    }
}

contract InheritanceCallBaseBase is InheritanceCallBaseBaseMid {
    function g(uint n) public returns (uint) {
        return f(n);
    }

    function h(uint n) public returns (uint) {
        return s(n);
    }
}
