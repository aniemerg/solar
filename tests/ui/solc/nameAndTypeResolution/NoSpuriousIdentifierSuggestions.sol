//@ compile-flags: -Ztypeck
contract c {
    function g() public {
        uint va = 1;
        uint vb = x; //~ ERROR: unresolved symbol `x`
     }
}
