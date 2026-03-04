//@ compile-flags: -Ztypeck
contract A {
    function f() external {}
    function f(uint256) external {}
}

contract B {
    function g() external {
        A.f; //~ ERROR: member `f` not found on type `type(contract A)`
    }
}
