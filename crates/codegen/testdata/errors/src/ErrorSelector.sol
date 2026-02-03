// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LErr {
    error E();
}
library SErr {
    error E(uint256);
}
library TErr {
    error E();
}

error E();

interface IErr {
    error E();
    function f() external pure;
}

contract D {
    error F();
}

contract ErrorSelector is D {
    function test1() public pure returns (bytes4, bytes4, bytes4, bytes4) {
        assert(LErr.E.selector == TErr.E.selector);
        assert(LErr.E.selector != SErr.E.selector);
        assert(E.selector == LErr.E.selector);
        assert(IErr.E.selector == LErr.E.selector);
        return (LErr.E.selector, SErr.E.selector, E.selector, IErr.E.selector);
    }

    bytes4 s1 = LErr.E.selector;
    bytes4 s2 = SErr.E.selector;
    bytes4 s3 = TErr.E.selector;
    bytes4 s4 = IErr.E.selector;

    function test2() external view returns (bytes4, bytes4, bytes4, bytes4) {
        return (s1, s2, s3, s4);
    }

    function test3() external pure returns (bytes4) {
        return F.selector;
    }
}
