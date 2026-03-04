//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        address payable a = address(0); //~ ERROR: invalid explicit type conversion
    }
}
