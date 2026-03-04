//@ compile-flags: -Ztypeck
library L {
    function f(uint a) internal pure {}
}
contract C {
    using L for *;
    function f() pure public {
        uint t;
        function() pure x;
        [t.f, x][0]({a: 8}); //~ ERROR: member `f` not found on type `uint256`
//~^ ERROR: expected function, found `<error>[2]`
    }
}
