//@ compile-flags: -Ztypeck
contract C {
    function() external immutable f; //~ ERROR: immutable variables of external function type are not yet supported
}
