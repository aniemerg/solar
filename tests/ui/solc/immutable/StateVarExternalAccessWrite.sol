//@ compile-flags: -Ztypeck
contract C {
    uint immutable public x = 42;

    function g() external view returns (uint) {}

    function f() public view {
        this.x = this.g; //~ ERROR: expression has to be an lvalue
//~^ ERROR: mismatched types
    }
}
