//@ compile-flags: -Ztypeck
contract C {
    function f() public returns (bool ret) {
        return this.f < this.f; //~ ERROR: cannot apply builtin operator `<` to `function () returns (bool)` and `function () returns (bool)`
    }
}
