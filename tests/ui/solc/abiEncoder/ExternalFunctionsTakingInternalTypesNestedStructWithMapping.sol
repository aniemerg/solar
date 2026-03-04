//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract C {
    struct T { mapping(uint => uint) a; }
    struct S { T[][2] b; }
    function f(S memory) public {} //~ ERROR: types containing mappings cannot be parameter or return types of public functions
}
