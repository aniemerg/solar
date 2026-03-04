//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        int x;
        abi.decode("", ((x = 1) > 0 ? int : int)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
