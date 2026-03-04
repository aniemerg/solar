//@ compile-flags: -Ztypeck
contract test {
    function f(bytes calldata) public; //~ ERROR: functions without implementation must be marked virtual
}
