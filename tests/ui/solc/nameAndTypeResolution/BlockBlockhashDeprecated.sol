//@ compile-flags: -Ztypeck
contract C {
    function f() public view returns (bytes32) {
        return block.blockhash(3); //~ ERROR: member `blockhash` not found on type `block`
    }
}
