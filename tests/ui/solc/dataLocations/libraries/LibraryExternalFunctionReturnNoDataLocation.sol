//@ compile-flags: -Ztypeck
library L {
    struct S { uint x; }
    function g() external pure returns (uint[2]) {} //~ ERROR: expected data location
    function h() external pure returns (uint[]) {} //~ ERROR: expected data location
    function i() external pure returns (S) {} //~ ERROR: expected data location
    function j() external pure returns (mapping(uint => uint)) {} //~ ERROR: expected data location
}
