//@ compile-flags: -Ztypeck
contract A {
    uint256 k = 7;
    uint256 constant amod = addmod(1, 8, k);
    uint256 constant mmod = mulmod(1, 8, k);

    bytes data = hex"ffff"; //~ ERROR: mismatched types
    bytes32 constant keccak = keccak256(data);
}
