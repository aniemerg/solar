//@ compile-flags: -Ztypeck
contract A {
    struct S {
        address payable a;
    }
    S s;
    function f() public {
        s.a = address(this); //~ ERROR: mismatched types
    }
}
