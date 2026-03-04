//@ compile-flags: -Ztypeck
contract Foo {
    function f() public {
        string memory long = "01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"; //~ ERROR: mismatched types
        string memory short = "123"; //~ ERROR: mismatched types
        long; short;
    }
}
