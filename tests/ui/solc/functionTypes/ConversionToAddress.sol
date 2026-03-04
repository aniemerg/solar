//@ compile-flags: -Ztypeck
contract C {
    function f() public view returns (address) {
        return address(this.f); //~ ERROR: invalid explicit type conversion
    }
}
