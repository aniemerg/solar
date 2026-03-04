//@ compile-flags: -Ztypeck
contract A {
    modifier mod() { _; }
}
contract B {
    function f() public {
        A.mod; //~ ERROR: member `mod` not found on type `type(contract A)`
    }
}
