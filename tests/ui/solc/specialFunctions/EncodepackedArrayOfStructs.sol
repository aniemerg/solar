//@ compile-flags: -Ztypeck
contract C {
    struct S { uint x; }
    function f() public pure {
        S[] memory s;
        abi.encodePacked(s); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
}
