//@compile-flags: -Ztypeck
contract C {
    function f(int256 a, int256 b) public returns (int256) {
        return a >> b; //~ ERROR: cannot apply builtin operator `>>` to `int256` and `int256`
    }
    function g(int256 a, int256 b) public returns (int256) {
        return a >> (256 - b); //~ ERROR: cannot apply builtin operator `>>` to `int256` and `int256`
    }
}
