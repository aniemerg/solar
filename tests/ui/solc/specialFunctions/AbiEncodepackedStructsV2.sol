//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract C {
    struct S { uint x; }
    S s;
    struct T { uint y; }
    T t;
    function f() public view {
        bytes32 a = sha256(abi.encodePacked(s, t)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        a;
    }
}
