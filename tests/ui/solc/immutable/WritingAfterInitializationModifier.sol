//@ compile-flags: -Ztypeck
contract C {
    uint immutable x = 0;

    function f() readX internal { }

    modifier readX() {
        _; x = 1; //~ ERROR: cannot assign to an immutable variable
    }
}
