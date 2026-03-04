//@ compile-flags: -Ztypeck
abstract contract C {
    function fn() public pure {
        (uint a,) = three(); //~ ERROR: mismatched number of components
        (,uint b) = three(); //~ ERROR: mismatched number of components
        (,uint c,) = five(); //~ ERROR: mismatched number of components
        (uint d, uint e,) = four(); //~ ERROR: mismatched number of components
        (,uint f, uint g) = four(); //~ ERROR: mismatched number of components
        (,uint h, uint i,) = three(); //~ ERROR: mismatched number of components
        (uint j,) = one(); //~ ERROR: mismatched number of components
        (,uint k) = one(); //~ ERROR: mismatched number of components
        (,uint l,) = one(); //~ ERROR: mismatched number of components
        (,uint m, uint n,) = five(); //~ ERROR: mismatched number of components
        a;b;c;d;e;f;g;h;i;j;k;l;m;n;
    }
    function one() public pure returns (uint) {}
    function two() public pure returns (uint, uint) {}
    function three() public pure returns (uint, uint, uint) {}
    function four() public pure returns (uint, uint, uint, uint) {}
    function five() public pure returns (uint, uint, uint, uint, uint) {}
}
