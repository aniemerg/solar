//@ compile-flags: -Ztypeck
contract C {
    function f() public pure { }
    function g() public pure { }
}

contract A {
    function test(bool b) public returns(bytes4) {
        (b ? C.f : C.g).selector; //~ ERROR: member `f` not found on type `type(contract C)`
//~^ ERROR: member `g` not found on type `type(contract C)`
    }
}
