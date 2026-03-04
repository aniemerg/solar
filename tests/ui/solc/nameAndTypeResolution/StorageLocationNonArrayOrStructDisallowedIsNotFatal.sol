//@ compile-flags: -Ztypeck
contract C {
    function f(uint storage a) public { //~ ERROR: data location can only be specified for array, struct or mapping types
        a = f;
    }
}
