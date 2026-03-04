//@ compile-flags: -Ztypeck
library L {
    struct S { uint x; }
    function g() private pure returns (uint[2]) {} //~ ERROR: expected data location
    function h() private pure returns (uint[]) {} //~ ERROR: expected data location
    function i() private pure returns (S) {} //~ ERROR: expected data location
    function j() private pure returns (mapping(uint => uint)) {} //~ ERROR: expected data location
    function gp(uint[2]) private pure {} //~ ERROR: expected data location
    function hp(uint[]) private pure {} //~ ERROR: expected data location
    function ip(S) private pure {} //~ ERROR: expected data location
    function jp(mapping(uint => uint)) private pure {} //~ ERROR: expected data location
}
