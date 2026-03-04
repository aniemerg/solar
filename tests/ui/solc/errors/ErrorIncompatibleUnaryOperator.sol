//@ compile-flags: -Ztypeck
error MyCustomError(uint, bool);

contract C {
    function f() pure public {
        MyCustomError++; //~ ERROR: expression has to be an lvalue
//~^ ERROR: cannot apply unary operator `++` to `error MyCustomError(uint256,bool)`
    }
}
