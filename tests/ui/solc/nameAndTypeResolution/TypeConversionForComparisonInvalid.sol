//@ compile-flags: -Ztypeck
contract test {
    function f() public { int32(2) == uint64(2); } //~ ERROR: cannot apply builtin operator `==` to `int32` and `uint64`
}
