//@ compile-flags: -Ztypeck
contract C {
    event MyCustomEvent(uint);
    function f() pure public {
        uint a;
        MyCustomEvent += 1; //~ ERROR: expression has to be an lvalue
//~^ ERROR: cannot apply builtin operator `+` to `event C.MyCustomEvent(uint256)` and `int_literal[1]`
        MyCustomEvent -= 1; //~ ERROR: expression has to be an lvalue
//~^ ERROR: cannot apply builtin operator `-` to `event C.MyCustomEvent(uint256)` and `int_literal[1]`
        a += MyCustomEvent; //~ ERROR: cannot apply builtin operator `+` to `uint256` and `event C.MyCustomEvent(uint256)`
        a -= MyCustomEvent; //~ ERROR: cannot apply builtin operator `-` to `uint256` and `event C.MyCustomEvent(uint256)`
    }
}
