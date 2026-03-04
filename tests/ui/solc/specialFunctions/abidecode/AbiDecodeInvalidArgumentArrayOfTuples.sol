//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        abi.decode("", ((uint, int)[5][6])); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: cannot index into tuple(type(uint256),type(int256))
    }
}
