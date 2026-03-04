//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        uint transient x = 0; //~ ERROR: data location can only be specified for array, struct or mapping types
    }
}
