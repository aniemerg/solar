//@ compile-flags: -Ztypeck
contract C {
    constructor(bytes32 _arg) {
    }
}

contract A {
    function f() public {
        new  C((1234)); //~ ERROR: mismatched types
    }
}
