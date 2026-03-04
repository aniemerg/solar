//@ compile-flags: -Ztypeck
contract C {
    function f() public pure returns (bool ret) {
        return f == f; //~ ERROR: cannot apply builtin operator `==` to `function () pure returns (bool)` and `function () pure returns (bool)`
    }
    function g() public pure returns (bool ret) {
        return f != f; //~ ERROR: cannot apply builtin operator `!=` to `function () pure returns (bool)` and `function () pure returns (bool)`
    }
}
