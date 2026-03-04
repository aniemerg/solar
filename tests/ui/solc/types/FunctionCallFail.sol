//@ compile-flags: -Ztypeck
contract C {
    function f(uint y) public pure {
        (4(y)) = 2; //~ ERROR: expected function, found `int_literal[3]`
//~^ ERROR: expression has to be an lvalue
    }
}
