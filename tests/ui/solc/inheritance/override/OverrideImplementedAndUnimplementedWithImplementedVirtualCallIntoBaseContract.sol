//@ compile-flags: -Ztypeck
contract A {
    function f() public virtual {}
}
abstract contract B {
    function f() public virtual;
}
abstract contract C is A, B {
    function g() public {
        f(); // Would call B.f() if we did not require an override in C.
//~^ ERROR: no matching declarations found
    }
}
