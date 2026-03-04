//@ compile-flags: -Ztypeck
library L {
    function f() public {}
}

interface I {
    using L for int; //~ ERROR: the `using for` directive is not allowed inside interfaces
    function g() external;
}
