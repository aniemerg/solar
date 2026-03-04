//@ compile-flags: -Ztypeck
contract C {
    function f(uint x, string memory y, bool z) internal {}
    function f(uint x, uint y, uint z) internal {}

    function call() internal {
        f({y: 1, x: "abc", z: true}); //~ ERROR: no matching declarations found
    }
}
