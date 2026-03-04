contract test {
    function f() public pure returns (bytes32) {
        bytes32 escapeCharacters = "This a test //~ ERROR: unescaped newline
        ";
        return escapeCharacters;
    }
}
