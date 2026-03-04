contract test {
    function f() public pure returns (bytes32) {
        bytes32 escapeCharacters = "\t\b\f"; //~ ERROR: unknown character escape
//~^ ERROR: unknown character escape
        return escapeCharacters;
    }
}
