//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        while (true)
        {
        }
        continue; //~ ERROR: `continue` outside of a loop
    }
}
