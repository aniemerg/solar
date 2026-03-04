//@compile-flags: -Ztypeck
pragma abicoder               v2;
contract C {
    struct S { uint256 x; }
    function f(S calldata s) external pure {
        s.x = 42; //~ ERROR: calldata structs are read-only
    }
}
