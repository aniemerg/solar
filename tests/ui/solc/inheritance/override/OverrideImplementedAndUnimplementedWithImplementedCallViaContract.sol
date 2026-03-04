//@ compile-flags: -Ztypeck
contract A {
    function f() public virtual {}
}
abstract contract B {
    function f() public virtual;
}
contract C is A, B {
    function f() public virtual override(A, B) {
        B.f(); // Should not skip over to A.f() just because B.f() has no implementation.
//~^ ERROR: member `f` not found on type `type(contract B)`
    }
}
