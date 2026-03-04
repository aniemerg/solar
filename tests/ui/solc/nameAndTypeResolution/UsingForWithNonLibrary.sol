//@ compile-flags: -Ztypeck
// This tests a crash that was resolved by making the first error fatal.
library L {
    struct S { uint d; }
    using S for S; //~ ERROR: expected library, found struct
    function f(S memory _s) internal {
        _s.d = 1;
    }
}
