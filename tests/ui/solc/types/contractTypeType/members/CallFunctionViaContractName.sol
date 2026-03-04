//@ compile-flags: -Ztypeck
contract A {
    function f() external {}
    function g() external pure {}
    function h() public pure {}
}

contract B {
    function i() external {
        A.f(); //~ ERROR: member `f` not found on type `type(contract A)`
        A.g(); //~ ERROR: member `g` not found on type `type(contract A)`
        A.h(); // might be allowed in the future
//~^ ERROR: member `h` not found on type `type(contract A)`
    }
}
