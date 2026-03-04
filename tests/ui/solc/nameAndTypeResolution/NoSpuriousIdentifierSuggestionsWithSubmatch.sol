//@ compile-flags: -Ztypeck
contract c {
    function g() public {
        uint va = 1;
        uint vb = vaxyz; //~ ERROR: unresolved symbol `vaxyz`
     }
}
