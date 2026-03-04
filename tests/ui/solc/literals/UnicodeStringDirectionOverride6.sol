//@compile-flags: -Ztypeck
contract C {
    function f() public pure
    {
        // PDF RLO
        bytes memory m = unicode" underflow ‬‮"; //~ ERROR: mismatched types
    }
}
