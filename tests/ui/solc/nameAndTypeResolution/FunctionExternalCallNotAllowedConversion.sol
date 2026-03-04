//@ compile-flags: -Ztypeck
contract C {}
contract Test {
    function externalCall() public {
        address arg;
        this.g(arg); //~ ERROR: mismatched types
    }
    function g (C c) external {}
}
