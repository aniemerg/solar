//@ compile-flags: -Ztypeck
contract test {
    function f(bytes4 memory) public; //~ ERROR: data location can only be specified for array, struct or mapping types
}
