//@ compile-flags: -Ztypeck
contract C {
    function f(bool c) pure public {
        type(c ? uint : uint); //~ ERROR: expected one of `)` or `[`, found `?`
    }
}
