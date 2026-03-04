//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        address(0x12).call{value: 2}("abc"); //~ ERROR: invalid explicit type conversion
    }
}
