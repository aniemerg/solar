//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract C {
    struct S { uint x; }
    S s;
    struct T { uint y; }
    T t;
    function e() public view {
        S memory st;
        abi.encodePacked(st); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
    function f() public view {
        abi.encode(s, t); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
    function g() public view {
        abi.encodePacked(s, t); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
