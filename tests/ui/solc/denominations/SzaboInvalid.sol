contract C {
    function f() public {
        uint x = 1 szabo; //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `szabo`
    }
}
