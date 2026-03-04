contract test {
    function f() public pure returns (string memory) {
        return "; //~ ERROR: unterminated string
//~^ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `<eof>`
    }
}
