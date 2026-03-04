//@ compile-flags: -Ztypeck
contract C {
    function f() external pure { }
}

contract D {
    function g() external pure { }
}

contract A {
    function test(bool b) public returns(bytes4) {
        (b ? C.f : D.g).selector; //~ ERROR: member `f` not found on type `type(contract C)`
//~^ ERROR: member `g` not found on type `type(contract D)`
    }
}
