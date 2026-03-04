//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        uint64 a = 3;
        int64 b = 4;
        fixed c = b; //~ ERROR: mismatched types
        ufixed d = a; //~ ERROR: mismatched types
        c; d;
    }
}
