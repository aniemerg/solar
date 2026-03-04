//@ compile-flags: -Ztypeck
contract C {
    function f() public view returns (address payable a, address b) {
        (address c, address payable d) = (address(this), payable(0)); //~ ERROR: invalid explicit type conversion
        (a,b) = (c,d); //~ ERROR: mismatched types
    }
}
