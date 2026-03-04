//@ compile-flags: -Ztypeck
contract test {
    function f(bytes transient) external; //~ ERROR: expected data location
}
