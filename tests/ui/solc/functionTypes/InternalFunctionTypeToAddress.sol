//@ compile-flags: -Ztypeck
contract C {
    function f() public returns (address) {
        return address(f); //~ ERROR: invalid explicit type conversion
    }
}
