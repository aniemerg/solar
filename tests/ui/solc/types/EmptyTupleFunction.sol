//@ compile-flags: -Ztypeck
contract C {
    function f() private pure {}
    function a() public pure {
        bool x = true;
        bool y = true;
        (x) ? (f(), y = false) : (f(), y = false); //~ ERROR: tuple components cannot be empty
//~^ ERROR: tuple components cannot be empty
    }
}
