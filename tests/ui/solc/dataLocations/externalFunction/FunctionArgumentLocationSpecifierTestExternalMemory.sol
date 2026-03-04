//@ compile-flags: -Ztypeck
contract test {
    function f(bytes memory) external; //~ ERROR: functions without implementation must be marked virtual
}
