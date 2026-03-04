//@ compile-flags: -Ztypeck
contract B {
    uint immutable x;

    function g() public {}
}

contract C is B {
    function f() public {
        super.x = 42; //~ ERROR: member `x` not found on type `contract C`
//~^ ERROR: expression has to be an lvalue
    }
}
