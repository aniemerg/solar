contract test {
    function f() public pure returns (bytes32) {
        bytes32 escapeCharacters = hex"aa" hex"bb" "cc"; //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `<string>`
        return escapeCharacters;
    }
}
