//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        uint a = (1,2); //~ ERROR: mismatched number of components
        uint b = (1,2,3); //~ ERROR: mismatched number of components
        uint c = (1,2,3,4); //~ ERROR: mismatched number of components
    }
    function g() public {
        (uint a1, uint b1, uint c1, uint d1) = 1; //~ ERROR: mismatched number of components
        (uint a2, uint b2, uint c2) = 1; //~ ERROR: mismatched number of components
        (uint a3, uint b3) = 1; //~ ERROR: mismatched number of components
    }
    function h() public {
        (uint a1, uint b1, uint c1, uint d1) = (1,2,3); //~ ERROR: mismatched number of components
        (uint a2, uint b2, uint c2) = (1,2,3,4); //~ ERROR: mismatched number of components
    }
}
