//@ compile-flags: -Ztypeck
pragma abicoder               v2;
contract C {
    struct S { mapping(uint => uint) a; }
    struct T { S s; }
    struct U { T t; }
    function f(U memory) public {} //~ ERROR: types containing mappings cannot be parameter or return types of public functions
}
