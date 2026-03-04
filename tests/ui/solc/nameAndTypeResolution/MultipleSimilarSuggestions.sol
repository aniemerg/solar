//@ compile-flags: -Ztypeck
contract c {
    function g() public {
        uint var1 = 1;
        uint var2 = 1;
        uint var3 = 1;
        uint var4 = 1;
        uint var5 = varx; //~ ERROR: unresolved symbol `varx`
    }
}
