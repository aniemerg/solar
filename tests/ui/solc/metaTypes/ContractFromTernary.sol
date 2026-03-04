//@ compile-flags: -Ztypeck
contract C {
    function f() public pure { }
    function g(bool c) public {
        (c ? C : C).f(); //~ ERROR: member `f` not found on type `type(contract C)`
    }
}
