//@ compile-flags: -Ztypeck
error MyCustomError(uint, bool);

contract C {
    function f() pure public {
        bytes.concat(MyCustomError, MyCustomError); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
