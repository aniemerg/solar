//@ compile-flags: -Ztypeck
contract C {
    function f() internal pure {}
    function g() internal pure returns (uint) { return 1; }
    function h() internal pure returns (uint, uint) { return (1, 2); }

    function test() internal pure {
        () = f(); //~ ERROR: expected one of `(`, `+`, `,`, `[`, `delete`, `new`, `payable`, `type`, elementary type name, identifier, or literal, found `)`
        () = g();
        (,) = h();
    }
}
