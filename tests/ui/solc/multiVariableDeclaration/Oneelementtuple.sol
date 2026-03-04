//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        (uint a,) = (1,); //~ ERROR: tuple components cannot be empty
        a;
    }
}
