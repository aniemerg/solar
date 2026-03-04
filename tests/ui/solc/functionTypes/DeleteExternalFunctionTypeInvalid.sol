//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        delete this.f; //~ ERROR: expression has to be an lvalue
    }
}
