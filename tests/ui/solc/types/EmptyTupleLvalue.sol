//@ compile-flags: -Ztypeck
contract C {
    function f() private pure {}
    function a() public {
        uint x;
        uint y;
        (x, y) = (f(), f()); //~ ERROR: tuple components cannot be empty
//~^ ERROR: tuple components cannot be empty
    }
}
