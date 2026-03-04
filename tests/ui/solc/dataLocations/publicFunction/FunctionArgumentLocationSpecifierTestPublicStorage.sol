//@ compile-flags: -Ztypeck
contract test {
    function f(bytes storage) public; //~ ERROR: invalid data location `storage`
}
