//@ compile-flags: -Ztypeck
library L {
    function f() public pure { }
}

contract C {
    function g(bool c) public {
        (c ? L : L).f(); //~ ERROR: member `f` not found on type `type(library L)`
    }
}
