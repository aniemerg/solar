//@ compile-flags: -Ztypeck
contract C {
    function f(bool b) public pure returns (uint) {
        return type(b ? uint : uint).max; //~ ERROR: expected one of `)` or `[`, found `?`
    }
}
