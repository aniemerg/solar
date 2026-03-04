//@ compile-flags: -Ztypeck
contract C {
    function f() public returns (uint) {
        return uint(this.f); //~ ERROR: invalid explicit type conversion
    }
}
