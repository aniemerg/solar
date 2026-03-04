//@ compile-flags: -Ztypeck
contract Parent1 {
    uint256 internal m_aMember1;
}
contract Parent2 is Parent1 {
    uint256 internal m_aMember2;
}
contract Child is Parent2 {
    function foo() public returns (uint256) { return Parent2.m_aMember1; } //~ ERROR: member `m_aMember1` not found on type `type(contract Parent2)`
}
