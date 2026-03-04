//@ compile-flags: -Ztypeck
contract test {
    function f(bytes storage) external; //~ ERROR: invalid data location `storage`
}
