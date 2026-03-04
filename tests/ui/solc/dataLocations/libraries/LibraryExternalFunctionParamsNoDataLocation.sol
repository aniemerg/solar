//@ compile-flags: -Ztypeck
library L {
    struct S { uint x; }
    function g(uint[2]) external pure {} //~ ERROR: expected data location
    function h(uint[]) external pure {} //~ ERROR: expected data location
    function i(S) external pure {} //~ ERROR: expected data location
    function j(mapping(uint => uint)) external pure {} //~ ERROR: expected data location
}
