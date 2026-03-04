//@ compile-flags: -Ztypeck
function f(uint x) pure { }

contract C {
    using f for uint; //~ ERROR: expected library, found function
    function g(uint x) public pure {
        x.f();
    }
}
