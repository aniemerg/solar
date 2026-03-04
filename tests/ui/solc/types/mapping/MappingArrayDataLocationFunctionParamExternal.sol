//@ compile-flags: -Ztypeck
contract c {
    function f1(mapping(uint => uint)[] calldata) pure external {} //~ ERROR: types containing mappings cannot be parameter or return types of public functions
}
