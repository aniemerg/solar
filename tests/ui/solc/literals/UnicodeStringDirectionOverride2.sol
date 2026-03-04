//@compile-flags: -Ztypeck
contract C {
    function f() public pure
    {
        // PDF PDF
        bytes memory m = unicode"underflow ‬‬"; //~ ERROR: mismatched types
    }
}
