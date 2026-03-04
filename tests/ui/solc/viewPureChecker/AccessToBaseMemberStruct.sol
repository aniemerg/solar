//@ compile-flags: -Ztypeck
contract A {
    struct S { uint x; }
    S s;
}

contract B is A {
    function f() public view {
        A.s = A.S(2); //~ ERROR: member `s` not found on type `type(contract A)`
//~^ ERROR: expression has to be an lvalue
//~^^ ERROR: member `S` not found on type `type(contract A)`
    }
    function g() public view {
        A.s.x = 2; //~ ERROR: member `s` not found on type `type(contract A)`
//~^ ERROR: expression has to be an lvalue
    }
    function h() public pure returns (uint) {
        return A.s.x; //~ ERROR: member `s` not found on type `type(contract A)`
    }
}
