//@ compile-flags: -Ztypeck
contract test {
    function f() public { int x = 3; int y = 4; x ** y; } //~ ERROR: cannot apply builtin operator `**` to `int256` and `int256`
    function h() public { uint8 x = 3; int16 y = 4; x ** y; } //~ ERROR: cannot apply builtin operator `**` to `uint8` and `int16`
    function i() public { int16 x = 4; x ** -3; } //~ ERROR: cannot apply builtin operator `**` to `int16` and `int_literal[2]`
}
