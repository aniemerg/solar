//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        if (true)
            continue; //~ ERROR: `continue` outside of a loop
    }
}
