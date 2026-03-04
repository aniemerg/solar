contract test {
    function f() public pure returns (bytes32) {
        bytes32 escapeCharacters = "This a test //~ ERROR: unterminated string
//~^ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `<eof>`
    }
}
