//@ compile-flags: -Ztypeck
contract C {
    function f(uint[] storage a) external {} //~ ERROR: invalid data location `storage`
}
