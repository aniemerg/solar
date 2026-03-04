//@ compile-flags: -Ztypeck
function f(uint x) pure { }

using f for uint;

contract C {
    function g(uint x) public pure {
        x.f(); //~ ERROR: member `f` not found on type `uint256`
    }
}
