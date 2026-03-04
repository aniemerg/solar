//@ compile-flags: -Ztypeck
struct S { int a; }

contract C {
    function f() pure public {
        abi.decode("", (((uint)))); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.decode("", ((((uint))))); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.decode("", (((S)))); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
