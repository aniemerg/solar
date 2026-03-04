//@ compile-flags: -Ztypeck
library L {
    function a() public pure {}
    function b() public pure { a(); }
}
