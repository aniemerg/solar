//@ compile-flags: -Ztypeck
contract C {
    function f(uint y) public pure returns (uint) {
        (f(y)) = 2; //~ ERROR: expression has to be an lvalue
    }
}
