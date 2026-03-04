//@ compile-flags: -Ztypeck
contract C {
    function f() public returns (string memory) {
        string[2] memory z = ["Hello", "World"]; //~ ERROR: mismatched types
        return (z[0]);
    }
}
