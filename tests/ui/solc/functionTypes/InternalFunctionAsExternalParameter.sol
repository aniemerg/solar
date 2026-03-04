//@ compile-flags: -Ztypeck
// It should not be possible to give internal functions
// as parameters to external functions.
contract C {
    function f(function(uint) internal returns (uint) x) public { //~ ERROR: types containing internal function pointers cannot be parameter or return types of public functions
    }
}
