//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        ufixed a = 3 ** ufixed(1.5); //~ ERROR: rational literals are not supported
//~^ ERROR: cannot apply builtin operator `**` to `int_literal[2]` and `ufixed256x0`
    }
}
