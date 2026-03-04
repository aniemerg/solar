//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        payable(address(0x12)).send(1); //~ ERROR: invalid explicit type conversion
    }
}
