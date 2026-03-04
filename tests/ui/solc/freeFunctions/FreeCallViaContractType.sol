//@compile-flags: -Ztypeck
contract C {
    function f() public pure {}
}
function fun() {
    C.f(); //~ ERROR: member `f` not found on type `type(contract C)`
}
