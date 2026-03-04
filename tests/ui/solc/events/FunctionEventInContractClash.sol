//@ compile-flags: -Ztypeck
contract A {
    event dup();
    function dup() public returns (uint) { //~ ERROR: identifier `dup` already declared
        return 1;
    }
}
