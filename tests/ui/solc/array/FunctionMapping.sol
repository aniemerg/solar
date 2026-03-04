pragma abicoder               v2;

contract Test {
    function f(mapping(uint => uint)[] memory x) public pure {} //~ ERROR: types containing mappings cannot be parameter or return types of public functions
}
