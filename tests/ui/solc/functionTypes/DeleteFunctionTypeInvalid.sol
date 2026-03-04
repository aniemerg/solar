//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        delete f; //~ ERROR: expression has to be an lvalue
    }
}
