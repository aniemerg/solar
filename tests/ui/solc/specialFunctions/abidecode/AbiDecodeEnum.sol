//@ compile-flags: -Ztypeck
contract C {
    enum Color { red, green, blue }
    function f() pure public {
        abi.decode("", (Color)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
