contract test {
    // this function returns an invalid unicode character
    function invalidLiteral() public pure returns (bytes32) {
        bytes32 invalid = "\u00xx"; //~ ERROR: invalid character in unicode escape
        return invalid;
    }

}
