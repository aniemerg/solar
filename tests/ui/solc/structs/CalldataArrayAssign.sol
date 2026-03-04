//@ compile-flags: -Ztypeck
pragma abicoder               v2;
contract Test {
    struct S { int[3] a; }
    function f(S calldata s, int[3] calldata a) external {
        s.a = a; //~ ERROR: calldata structs are read-only
    }
}
