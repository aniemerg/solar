//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract C {
    struct S { uint a; S[][][] sub; }
    struct T { S s; }
    function f() public pure returns (uint x, T memory t) { //~ ERROR: recursive types cannot be parameter or return types of public functions
    }
}
