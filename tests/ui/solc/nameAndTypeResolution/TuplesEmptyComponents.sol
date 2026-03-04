//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        (1,,2); //~ ERROR: tuple components cannot be empty
    }
}
