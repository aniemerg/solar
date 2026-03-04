//@ compile-flags: -Ztypeck
abstract contract B {
    function f() public virtual;
}
contract C is B {
    function f() public override {
        B.f(); //~ ERROR: member `f` not found on type `type(contract B)`
    }
}
