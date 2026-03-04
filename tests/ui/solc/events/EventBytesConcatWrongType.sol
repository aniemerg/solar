//@ compile-flags: -Ztypeck
contract C {
    event MyCustomEvent(uint);
    function f() pure public {
        bytes.concat(MyCustomEvent, MyCustomEvent); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
