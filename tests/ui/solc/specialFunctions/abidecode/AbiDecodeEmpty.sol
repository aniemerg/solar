//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        abi.decode("abc", ()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
