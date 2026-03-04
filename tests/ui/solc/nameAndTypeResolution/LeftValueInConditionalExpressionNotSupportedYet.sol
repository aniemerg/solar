//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        uint x;
        uint y;
        (true ? x : y) = 1; //~ ERROR: expression has to be an lvalue
    }
}
