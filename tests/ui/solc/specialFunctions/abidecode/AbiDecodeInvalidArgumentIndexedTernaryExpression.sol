//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        bool x;
        abi.decode("", ((x = true ? uint : uint)[0])); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: mismatched types
//~^^ ERROR: mismatched types
//~^^^ ERROR: mismatched types
//~^^^^ ERROR: cannot index into bool
    }
}
