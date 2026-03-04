contract C {
    function f() public {
        uint x = 1 finney; //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `finney`
    }
}
