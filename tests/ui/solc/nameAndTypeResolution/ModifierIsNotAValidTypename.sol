//@ compile-flags: -Ztypeck
contract test {
    modifier mod() { _; }

    function f() public {
        mod g; //~ ERROR: name has to refer to a valid user-defined type
    }
}
