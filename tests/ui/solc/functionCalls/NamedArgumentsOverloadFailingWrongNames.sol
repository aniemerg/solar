//@ compile-flags: -Ztypeck
contract C {
    function f(uint x, string memory y, bool z) internal {}
    function f(uint x, uint y, uint z) internal {}

    function call() internal {
        f({a: 1, b: "abc", c: true}); //~ ERROR: no matching declarations found
    }
}
