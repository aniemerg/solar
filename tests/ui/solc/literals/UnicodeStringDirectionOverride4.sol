//@compile-flags: -Ztypeck
contract C {
    function f() public pure
    {
        // RLO RLO
        bytes memory m = unicode"overflow ‮‮"; //~ ERROR: mismatched types
    }
}
