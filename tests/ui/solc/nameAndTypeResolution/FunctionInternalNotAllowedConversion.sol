//@ compile-flags: -Ztypeck
contract C {
    uint a;
}
contract Test {
    address a;
    function g (C c) public {}
    function internalCall() public {
        g(a); //~ ERROR: mismatched types
    }
}
