//@ compile-flags: -Ztypeck
contract A {
    function x() public {}
}

contract B is A {
    function f() public view {
        A.x(); //~ ERROR: member `x` not found on type `type(contract A)`
    }
}
