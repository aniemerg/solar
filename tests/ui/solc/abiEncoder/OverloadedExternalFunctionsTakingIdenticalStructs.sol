//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract C {
    struct S1 { int i; }
    struct S2 { int i; }
    function f(S1 memory) public pure {} //~ ERROR: function overload clash during conversion to external types for arguments
    function f(S2 memory) public pure {}
}
