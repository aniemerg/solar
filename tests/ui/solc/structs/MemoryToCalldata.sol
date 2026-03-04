//@ compile-flags: -Ztypeck
pragma abicoder               v2;
contract Test {
    struct S { int a; }
    function f(S calldata s) external { s = S(2); } //~ ERROR: mismatched types
    function g(S calldata s) external { S memory m; s = m; } //~ ERROR: mismatched types
}
