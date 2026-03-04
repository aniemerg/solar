contract test {
    function f() public pure returns (bytes32) {
        bytes32 escapeCharacters = hex"0000"
        "deaf" //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `<string>`
        "feed";
        return escapeCharacters;
    }
}
