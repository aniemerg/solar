//@ compile-flags: -Ztypeck
pragma abicoder               v2;
contract Test {
    struct S { int a; }
    function f(S calldata s) external { s.a = 4; } //~ ERROR: calldata structs are read-only
}
