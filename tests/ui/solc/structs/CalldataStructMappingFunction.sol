//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract test {
    struct S {
        T t;
    }
    struct T {
        mapping (uint => uint) k;
    }
    function f(S calldata b) external { //~ ERROR: types containing mappings cannot be parameter or return types of public functions
    }
}
