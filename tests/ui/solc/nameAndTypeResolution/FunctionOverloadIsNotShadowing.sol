//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {}
    function f(uint) pure public {}
}
