//@ compile-flags: -Ztypeck
contract C {
    function f(uint[] transient transient x) public pure { } //~ ERROR: data location already specified
}
