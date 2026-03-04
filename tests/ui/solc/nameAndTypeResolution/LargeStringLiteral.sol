//@ compile-flags: -Ztypeck
contract test {
    function f() public { string memory x = "123456789012345678901234567890123"; } //~ ERROR: mismatched types
}
