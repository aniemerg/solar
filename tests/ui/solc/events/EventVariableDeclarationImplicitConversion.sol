//@ compile-flags: -Ztypeck
contract C {
    event MyCustomEvent(uint);
    function f() public {
        bytes4 a = MyCustomEvent; //~ ERROR: mismatched types
    }
}
