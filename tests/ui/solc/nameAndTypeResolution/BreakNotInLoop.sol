//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        if (true)
            break; //~ ERROR: `break` outside of a loop
    }
}
