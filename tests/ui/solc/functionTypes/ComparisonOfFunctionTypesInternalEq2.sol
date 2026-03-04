//@ compile-flags: -Ztypeck
contract C {
    function f() internal {}
    function g() internal {}

    function test() public pure returns (bool) {
        function () internal ptr = C.f; //~ ERROR: member `f` not found on type `type(contract C)`
        return ptr == C.g; //~ ERROR: member `g` not found on type `type(contract C)`
    }
}
