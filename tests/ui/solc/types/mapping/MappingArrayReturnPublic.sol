//@ compile-flags: -Ztypeck
contract C {
    function f() public pure returns (mapping(uint=>uint)[] storage m) { //~ ERROR: invalid data location `storage`
//~^ ERROR: types containing mappings cannot be parameter or return types of public functions
    }
}
