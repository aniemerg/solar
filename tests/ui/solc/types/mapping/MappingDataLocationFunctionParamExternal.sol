//@ compile-flags: -Ztypeck
contract c {
    function f1(mapping(uint => uint) calldata) pure external returns (mapping(uint => uint) memory) {} //~ ERROR: types containing mappings cannot be parameter or return types of public functions
//~^ ERROR: types containing mappings cannot be parameter or return types of public functions
}
