//@ compile-flags: -Ztypeck
contract C {
    function f() private pure {}
    function a() public {
        uint x;
        uint y;
        (x, y) = [f(), f()]; //~ ERROR: mismatched types
    }
}
