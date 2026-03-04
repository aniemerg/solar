//@ compile-flags: -Ztypeck
contract c {
    function f3(mapping(uint => uint) memory) view public {} //~ ERROR: types containing mappings cannot be parameter or return types of public functions
}
