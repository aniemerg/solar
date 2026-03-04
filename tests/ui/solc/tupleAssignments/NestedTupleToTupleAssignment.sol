//@ compile-flags: -Ztypeck
contract C {
    bool x;

    function foo() external {
        (((),x)&x) = ((), true); //~ ERROR: tuple components cannot be empty
//~^ ERROR: expression has to be an lvalue
//~^^ ERROR: tuple components cannot be empty
        (((),x)+x) = ((), true); //~ ERROR: tuple components cannot be empty
//~^ ERROR: expression has to be an lvalue
//~^^ ERROR: tuple components cannot be empty
        (((),x)-x) = ((), true); //~ ERROR: tuple components cannot be empty
//~^ ERROR: expression has to be an lvalue
//~^^ ERROR: tuple components cannot be empty
        (((),x)/x) = ((), true); //~ ERROR: tuple components cannot be empty
//~^ ERROR: expression has to be an lvalue
//~^^ ERROR: tuple components cannot be empty
        (((),x)*x) = ((), true); //~ ERROR: tuple components cannot be empty
//~^ ERROR: expression has to be an lvalue
//~^^ ERROR: tuple components cannot be empty
        (((),x)|x) = ((), true); //~ ERROR: tuple components cannot be empty
//~^ ERROR: expression has to be an lvalue
//~^^ ERROR: tuple components cannot be empty
    }
}
