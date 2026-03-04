//@ compile-flags: -Ztypeck
contract C {
    function g(bool x) public pure {
        require(x); //~ ERROR: no matching declarations found
    }
    function f(bool x) public returns (uint) {
        this.g{gas: 8000}(x);
    }
}
