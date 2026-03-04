//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        abi.decode("", ((uint)[2])); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.decode("", ((uint)[])); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.decode("", ((uint)[][3])); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.decode("", ((uint)[4][])); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.decode("", ((uint)[5][6])); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.decode("", (((uint))[5][6])); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
