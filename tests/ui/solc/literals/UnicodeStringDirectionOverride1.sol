//@compile-flags: -Ztypeck
contract C {
    function f() public pure
    {
        // PDF
        bytes memory s = unicode"underflow ‬"; //~ ERROR: mismatched types
    }
}
