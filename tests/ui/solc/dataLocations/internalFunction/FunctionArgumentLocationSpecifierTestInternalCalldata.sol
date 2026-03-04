//@ compile-flags: -Ztypeck
contract test {
    function f(bytes calldata) internal; //~ ERROR: functions without implementation must be marked virtual
}
