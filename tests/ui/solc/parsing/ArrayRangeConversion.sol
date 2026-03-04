//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        uint[] memory x;
        uint[1:](x); //~ ERROR: can only slice arrays
//~^ ERROR: cannot index
        uint[1:2](x); //~ ERROR: can only slice arrays
//~^ ERROR: cannot index
        uint[][1:](x); //~ ERROR: can only slice arrays
//~^ ERROR: cannot index
    }
}
