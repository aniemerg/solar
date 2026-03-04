//@ compile-flags: -Ztypeck
contract C {
    event e(uint u, string s);
    event e(string s, uint u);

    function call() public {
        emit e({u: 2, s: "abc"}); //~ ERROR: no matching declarations found
    }
}
