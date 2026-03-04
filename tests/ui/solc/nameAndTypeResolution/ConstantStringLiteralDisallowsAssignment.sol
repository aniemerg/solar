//@ compile-flags: -Ztypeck
contract Test {
    string constant x = "abefghijklmnopqabcdefghijklmnopqabcdefghijklmnopqabca"; //~ ERROR: mismatched types
    function f() public {
        // Even if this is made possible in the future, we should not allow assignment
        // to elements of constant arrays.
        x[0] = "f"; //~ ERROR: cannot index into string memory
//~^ ERROR: cannot assign to a constant variable
    }
}
