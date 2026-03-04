//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        address payable a = address(0x00000000219ab540356cBB839Cbe05303d7705Fa); //~ ERROR: mismatched types
        address payable b = 0x00000000219ab540356cBB839Cbe05303d7705Fa; //~ ERROR: mismatched types
    }
}
