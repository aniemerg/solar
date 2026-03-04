//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract C {
    struct S { uint a; S[2][] sub; }
    function f() public pure returns (uint, S memory) { //~ ERROR: recursive types cannot be parameter or return types of public functions
    }
}
