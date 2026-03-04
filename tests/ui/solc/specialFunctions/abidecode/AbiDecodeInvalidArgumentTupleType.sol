//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        abi.decode("", ((uint, int))); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
