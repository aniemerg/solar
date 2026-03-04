//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        uint x; uint y;
        assembly { x, y := 7 } //~ ERROR: only function calls are allowed in multi-assignment
    }
}
