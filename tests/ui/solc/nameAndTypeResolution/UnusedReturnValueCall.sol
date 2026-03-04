//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        address(0x12).call("abc"); //~ ERROR: invalid explicit type conversion
    }
}
