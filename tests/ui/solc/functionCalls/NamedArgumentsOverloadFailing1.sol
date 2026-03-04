//@ compile-flags: -Ztypeck
contract C {
    function f(uint x) internal { }
    function f(uint x, uint y) internal { }
    function f(uint x, uint y, uint z) internal { }
    function call() internal {
        f(1, 2); //~ ERROR: no matching declarations found
        f(1); //~ ERROR: no matching declarations found

        f({x: 1, y: 2}); //~ ERROR: no matching declarations found
        f({y: 2}); //~ ERROR: no matching declarations found
    }
}
