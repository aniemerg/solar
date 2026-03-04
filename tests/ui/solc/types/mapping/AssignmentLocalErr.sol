//@ compile-flags: -Ztypeck
contract D {
    mapping (uint => uint) a;
    mapping (uint => uint) b;
    function foo() public view {
        mapping (uint => uint) storage c = b;
        b = c; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
    }
}
