//@ compile-flags: -Ztypeck
contract A {
    modifier mod() { _; }
}
contract B is A {
    function f() public {
        A.mod; //~ ERROR: member `mod` not found on type `type(contract A)`
    }
}
