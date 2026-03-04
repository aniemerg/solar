//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        uint a = two(); //~ ERROR: mismatched number of components
        uint b = three(); //~ ERROR: mismatched number of components
        uint c = four(); //~ ERROR: mismatched number of components
    }
    function g() public {
        (uint a1, uint b1, uint c1, uint d1) = one(); //~ ERROR: mismatched number of components
        (uint a2, uint b2, uint c2) = one(); //~ ERROR: mismatched number of components
        (uint a3, uint b3) = one(); //~ ERROR: mismatched number of components
    }
    function h() public {
        (uint a1, uint b1, uint c1, uint d1) = three(); //~ ERROR: mismatched number of components
        (uint a2, uint b2, uint c2) = four(); //~ ERROR: mismatched number of components
    }
    function one() public pure returns (uint) {}
    function two() public pure returns (uint, uint) {}
    function three() public pure returns (uint, uint, uint) {}
    function four() public pure returns (uint, uint, uint, uint) {}
}
