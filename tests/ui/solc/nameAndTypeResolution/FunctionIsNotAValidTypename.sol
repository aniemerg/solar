//@ compile-flags: -Ztypeck
contract test {
    function foo() public {
    }

    function f() public {
        foo g; //~ ERROR: name has to refer to a valid user-defined type
    }
}
