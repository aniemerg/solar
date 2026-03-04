//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        address(0x11223345567aaaaaaaaaaaaaaaaaaaaaaaaaaaaa0112233445566778899001122); //~ ERROR: integer part too large
    }
}
