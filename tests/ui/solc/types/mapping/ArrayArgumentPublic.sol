//@ compile-flags: -Ztypeck
contract C {
    function f(mapping(uint => uint)[] storage) public pure { //~ ERROR: invalid data location `storage`
//~^ ERROR: types containing mappings cannot be parameter or return types of public functions
    }
}
