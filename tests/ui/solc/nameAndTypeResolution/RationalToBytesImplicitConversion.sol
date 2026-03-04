//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        bytes32 c = 3.2; c; //~ ERROR: rational literals are not supported
    }
}
