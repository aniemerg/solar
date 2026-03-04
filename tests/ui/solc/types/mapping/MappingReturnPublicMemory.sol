//@ compile-flags: -Ztypeck
contract C {
    function f() public pure returns (mapping(uint=>uint) memory m) { //~ ERROR: types containing mappings cannot be parameter or return types of public functions
    }
}
