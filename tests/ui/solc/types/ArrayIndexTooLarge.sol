//@ compile-flags: -Ztypeck
contract C {
    function f() public returns (string memory) {
        // this used to cause an internal error
        return (["zeppelin"][123456789012345678901234567890123456789012345678901234567890123456789012345678]); //~ ERROR: integer part too large
    }
}
