contract test {
    function f() public pure returns (bytes32) {
        bytes32 escapeCharacters = "foo" "bar" hex"aa"; //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `<hex string>`
        return escapeCharacters;
    }
}
