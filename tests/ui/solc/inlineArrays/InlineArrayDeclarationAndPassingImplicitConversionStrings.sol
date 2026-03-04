//@ compile-flags: -Ztypeck
contract C {
    function f() public returns (string memory) {
        string memory x = "Hello"; //~ ERROR: mismatched types
        string memory y = "World"; //~ ERROR: mismatched types
        string[2] memory z = [x, y]; //~ ERROR: mismatched types
        return (z[0]);
    }
}
