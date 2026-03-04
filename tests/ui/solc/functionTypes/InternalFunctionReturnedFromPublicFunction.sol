//@ compile-flags: -Ztypeck
// It should not be possible to return internal functions from external functions.
contract C {
    function f() public returns (function(uint) internal returns (uint) x) { //~ ERROR: types containing internal function pointers cannot be parameter or return types of public functions
    }
}
