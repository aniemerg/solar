//@ compile-flags: -Ztypeck
contract C {
    event e(uint u, string s);
    event e(bytes s, int u);

    function call() public {
        emit e({u: 2, s: "abc"}); //~ ERROR: no matching declarations found
    }
}
