//@ compile-flags: -Ztypeck
contract B {
    function f() external {}
    function g() internal {}
}
contract C is B {
    function i() public {
        B.f(); //~ ERROR: member `f` not found on type `type(contract B)`
        B.g.selector; //~ ERROR: member `g` not found on type `type(contract B)`
    }
}
