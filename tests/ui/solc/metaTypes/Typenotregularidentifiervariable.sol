//@ compile-flags: -Ztypeck
contract Test {
    function f() public pure {
        uint type; //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, `payable`, `pure`, `view`, or `{`, found keyword `type`
    }
}
