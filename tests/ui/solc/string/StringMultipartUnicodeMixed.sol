contract test {
    function f() public pure returns (bytes32) {
        bytes32 escapeCharacters = "foo" hex"aa" unicode"😃, 😭, and 😈" "!" hex"00"; //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `<hex string>`
        return escapeCharacters;
    }
}
