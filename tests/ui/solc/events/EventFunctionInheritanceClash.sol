//@ compile-flags: -Ztypeck
contract A {
    function dup() public returns (uint) {
        return 1;
    }
}
contract B {
    event dup(); //~ ERROR: identifier `dup` already declared
}
contract C is A, B {
}
