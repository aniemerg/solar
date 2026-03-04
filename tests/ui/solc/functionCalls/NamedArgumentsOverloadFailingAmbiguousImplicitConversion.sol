//@ compile-flags: -Ztypeck
contract C {
    function f(uint x, string memory y) internal {}
    function f(bytes memory y, int x) internal {}

    function call() internal {
        f({x: 1, y: "abc"}); //~ ERROR: no matching declarations found
    }
}
