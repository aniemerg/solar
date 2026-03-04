//@ compile-flags: -Ztypeck
contract test {
    function g() public { f(); }
    function f() public {}
}
