//@ compile-flags: -Ztypeck
contract C {
    function(bytes memory) internal public a; //~ ERROR: types containing internal function pointers cannot be parameter or return types of public getter functions
}
