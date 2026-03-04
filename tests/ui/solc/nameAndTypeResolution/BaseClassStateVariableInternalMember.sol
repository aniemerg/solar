//@ compile-flags: -Ztypeck
contract Parent {
    uint256 internal m_aMember;
}
contract Child is Parent {
    function foo() public returns (uint256) { return Parent.m_aMember; } //~ ERROR: member `m_aMember` not found on type `type(contract Parent)`
}
