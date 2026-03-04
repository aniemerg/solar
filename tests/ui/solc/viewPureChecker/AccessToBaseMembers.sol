//@ compile-flags: -Ztypeck
contract A {
    uint x;
}

contract B is A {
    function f() public pure returns (uint) {
        return A.x; //~ ERROR: member `x` not found on type `type(contract A)`
    }
    function g() public view {
        A.x = 5; //~ ERROR: member `x` not found on type `type(contract A)`
//~^ ERROR: expression has to be an lvalue
    }
}
