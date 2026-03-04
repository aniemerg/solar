//@ compile-flags: -Ztypeck
error MyCustomError(uint, bool);

contract C {
    function f() pure public {
        uint a;
        MyCustomError += 1; //~ ERROR: expression has to be an lvalue
//~^ ERROR: cannot apply builtin operator `+` to `error MyCustomError(uint256,bool)` and `int_literal[1]`
        MyCustomError -= 1; //~ ERROR: expression has to be an lvalue
//~^ ERROR: cannot apply builtin operator `-` to `error MyCustomError(uint256,bool)` and `int_literal[1]`
        a += MyCustomError; //~ ERROR: cannot apply builtin operator `+` to `uint256` and `error MyCustomError(uint256,bool)`
        a -= MyCustomError; //~ ERROR: cannot apply builtin operator `-` to `uint256` and `error MyCustomError(uint256,bool)`
    }
}
