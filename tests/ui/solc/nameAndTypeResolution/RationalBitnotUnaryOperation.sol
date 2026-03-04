//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        ~fixed(3.5); //~ ERROR: rational literals are not supported
//~^ ERROR: cannot apply unary operator `~` to `fixed256x0`
    }
}
