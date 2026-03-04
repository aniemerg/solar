//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        bytes32 x;
        x[0] = 0x42; //~ ERROR: single bytes in fixed bytes arrays cannot be modified
//~^ ERROR: mismatched types
    }
}
