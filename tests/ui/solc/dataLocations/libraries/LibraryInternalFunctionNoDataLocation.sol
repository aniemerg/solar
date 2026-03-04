//@ compile-flags: -Ztypeck
library L {
    struct S { uint x; }
    function g() internal pure returns (uint[2]) {} //~ ERROR: expected data location
    function h() internal pure returns (uint[]) {} //~ ERROR: expected data location
    function i() internal pure returns (S) {} //~ ERROR: expected data location
    function j() internal pure returns (mapping(uint => uint)) {} //~ ERROR: expected data location
    function gp(uint[2]) internal pure {} //~ ERROR: expected data location
    function hp(uint[]) internal pure {} //~ ERROR: expected data location
    function ip(S) internal pure {} //~ ERROR: expected data location
    function jp(mapping(uint => uint)) internal pure {} //~ ERROR: expected data location
}
