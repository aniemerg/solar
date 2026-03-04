//@ compile-flags: -Ztypeck
pragma abicoder               v2;

struct S {
    uint x;
}

contract C {
    function f() public pure {
        abi.decode("1234", (S)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
