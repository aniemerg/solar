//@ compile-flags: -Ztypeck
library L {
    struct R { uint[10][10] y; }
    struct S { uint a; uint b; uint[20][20][20] c; R d; }
}
contract C {
    function f(uint size) public {
        L.S[][] memory x = new L.S[][](10); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
        uint[] memory y = new uint[](20); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
        bytes memory z = new bytes(size); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
        x;y;z;
    }
}
