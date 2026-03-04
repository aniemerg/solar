//@ compile-flags: -Ztypeck
contract C {
    event MyCustomEvent(uint);
    function f() pure public {
        MyCustomEvent++; //~ ERROR: expression has to be an lvalue
//~^ ERROR: cannot apply unary operator `++` to `event C.MyCustomEvent(uint256)`
    }
}
