//@ compile-flags: -Ztypeck
contract C {
    struct S { uint a; uint b; mapping(uint=>uint) c; }

    function f() public {
        S({a: 1}); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 3
    }
}
