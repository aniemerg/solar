//@ compile-flags: -Ztypeck
contract test {
    struct s { uint a; uint b;}
    function f() pure public returns (bytes1) {
        s[75555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555]; //~ ERROR: integer part too large
        s[7];
    }
}
