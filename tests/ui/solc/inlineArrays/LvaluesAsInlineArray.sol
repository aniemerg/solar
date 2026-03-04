//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        [1, 2, 3]++; //~ ERROR: expression has to be an lvalue
//~^ ERROR: cannot apply unary operator `++` to `uint8[3]`
        [1, 2, 3] = [4, 5, 6]; //~ ERROR: expression has to be an lvalue
    }
}
