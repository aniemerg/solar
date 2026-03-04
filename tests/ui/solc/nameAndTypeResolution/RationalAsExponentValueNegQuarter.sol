//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        42 ** (-1/4); //~ ERROR: cannot apply builtin operator `**` to `int_literal[6]` and `int8`
    }
}
