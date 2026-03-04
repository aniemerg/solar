//@ compile-flags: -Ztypeck
contract C {
    function f() payable public {
        bytes32 h = keccak256(abi.encodePacked(keccak256, f, this.f{value: 2}, blockhash)); //~ ERROR: call options must be part of a call expression
        h;
    }
}
