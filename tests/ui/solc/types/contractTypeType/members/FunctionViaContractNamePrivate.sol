//@ compile-flags: -Ztypeck
contract A {
    function f() private {}
}

contract B {
    function g() external {
        A.f; //~ ERROR: member `f` not found on type `type(contract A)`
    }
}
