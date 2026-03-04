//@compile-flags: -Ztypeck
contract C {
    function f() internal {
    }
    function g() internal {

        g = f; //~ ERROR: expression has to be an lvalue
//~^ ERROR: mismatched types
    }
    function h() external {
    }
    function i() external {

        this.i = this.h; //~ ERROR: expression has to be an lvalue
//~^ ERROR: mismatched types
    }
}
