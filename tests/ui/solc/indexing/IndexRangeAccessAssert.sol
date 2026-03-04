//@ compile-flags: -Ztypeck
// Used to trigger assert
contract s{}
function f() {s[:][];} //~ ERROR: can only slice arrays
//~^ ERROR: cannot index
