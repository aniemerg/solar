//@ compile-flags: -Ztypeck
struct S { mapping(uint => uint)[2] a; }
contract C {
    function f(S storage s) public {} //~ ERROR: invalid data location `storage`
//~^ ERROR: types containing mappings cannot be parameter or return types of public functions
}
