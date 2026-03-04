//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        abi.decode("", ([uint][2])); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
