function f() public pure {
    revert 1; //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `<integer>`
}
