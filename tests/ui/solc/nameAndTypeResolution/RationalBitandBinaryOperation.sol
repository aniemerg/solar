//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        fixed(1.75) & 3; //~ ERROR: rational literals are not supported
//~^ ERROR: cannot apply builtin operator `&` to `fixed256x0` and `int_literal[2]`
    }
}
