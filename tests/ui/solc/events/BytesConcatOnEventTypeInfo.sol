//@ compile-flags: -Ztypeck
contract C {
    event MyCustomEvent(uint);
    function f() public {
        bytes memory a;
        bytes memory b = type(MyCustomEvent).concat(a); //~ ERROR: name has to refer to a valid user-defined type
//~^ ERROR: invalid type
    }
}
