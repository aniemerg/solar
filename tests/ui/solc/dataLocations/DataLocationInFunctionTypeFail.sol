//@ compile-flags: -Ztypeck
library L {
    struct Nested { uint y; }
    function b(function(Nested calldata) external returns (uint)[] storage) external pure {}
    function d(function(Nested storage) external returns (uint)[] storage) external pure {}
    function f(function(Nested transient) external returns (uint)[] storage) external pure {} //~ WARN: named function type parameters are deprecated
//~^ ERROR: expected data location
}
