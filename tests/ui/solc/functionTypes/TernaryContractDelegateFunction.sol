//@ compile-flags: -Ztypeck
library L {
    function f() external {}
}

contract C {
    function test() public {
        (true ? L.f : L.f).selector; //~ ERROR: member `f` not found on type `type(library L)`
//~^ ERROR: member `f` not found on type `type(library L)`
    }
}
