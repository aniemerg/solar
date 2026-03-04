//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract C {
    struct S { mapping(uint => uint) a; }
    function f(S memory) public {} //~ ERROR: types containing mappings cannot be parameter or return types of public functions
}
