contract test {
    function f() public pure returns (bytes32) {
        bytes32 escapeCharacters = hex"aa" hex"b"; //~ ERROR: odd number of hex nibbles
        return escapeCharacters;
    }
}
