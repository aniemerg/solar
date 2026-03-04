//@ compile-flags: -Ztypeck
contract C {
    function fn() public pure {
        (uint a,) = (1,2,3); //~ ERROR: mismatched number of components
        (,uint b) = (1,2,3); //~ ERROR: mismatched number of components
        (,uint c,) = (1,2,3,4,5); //~ ERROR: mismatched number of components
        (uint d, uint e,) = (1,2,3,4); //~ ERROR: mismatched number of components
        (,uint f, uint g) = (1,2,3,4); //~ ERROR: mismatched number of components
        (,uint h, uint i,) = (1,2,3); //~ ERROR: mismatched number of components
        (uint j,) = 1; //~ ERROR: mismatched number of components
        (,uint k) = 1; //~ ERROR: mismatched number of components
        (,uint l,) = 1; //~ ERROR: mismatched number of components
        a;b;c;d;e;f;g;h;i;j;k;l;
    }
}
