//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract C {
    struct S { function() internal a; }
    function f(S memory) public {} //~ ERROR: types containing internal function pointers cannot be parameter or return types of public functions
}
