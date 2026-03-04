//@ compile-flags: -Ztypeck
error MyCustomError(uint, bool);
contract C {
    function f() public {
        bytes memory a;
        bytes memory b = type(MyCustomError).concat(a); //~ ERROR: name has to refer to a valid user-defined type
//~^ ERROR: invalid type
    }
}
