//@ compile-flags: -Ztypeck
contract C {
    struct S { uint a; uint b; }

    function f() public {
        S memory s = S({a: 1}); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 2
    }
}
