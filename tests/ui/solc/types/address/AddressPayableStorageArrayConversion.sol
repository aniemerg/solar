//@ compile-flags: -Ztypeck
contract C {
    address payable[] a;
    address[] b;
    function f() public view {
        address payable[] storage c = a;
        address[] storage d = b;
        d = c; // TODO: this could be allowed in the future
//~^ ERROR: mismatched types
    }
}
