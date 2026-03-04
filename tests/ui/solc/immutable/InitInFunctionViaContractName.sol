//@ compile-flags: -Ztypeck
contract B {
    uint immutable x;
}

contract C is B {
    function f() public {
        B.x = 42; //~ ERROR: member `x` not found on type `type(contract B)`
//~^ ERROR: expression has to be an lvalue
    }
}
