//@ compile-flags: -Ztypeck
contract C {
    function f(uint x, string memory y, bool z) internal {}
    function f(string memory y, uint x, bool z) internal {}
    function f(bool z, string memory y, uint x) internal {}

    function call() internal {
        f({x: 1, y: "abc", z: true}); //~ ERROR: no matching declarations found
    }
}
