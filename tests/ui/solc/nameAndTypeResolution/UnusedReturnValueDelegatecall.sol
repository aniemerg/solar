//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        address(0x12).delegatecall("abc"); //~ ERROR: invalid explicit type conversion
    }
}
