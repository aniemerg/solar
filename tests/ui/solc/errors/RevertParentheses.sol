//@ compile-flags: -Ztypeck
error E(uint a, uint b);
contract C {
    function f() public pure {
        revert(E(2, 7)); //~ ERROR: no matching declarations found
    }
}
