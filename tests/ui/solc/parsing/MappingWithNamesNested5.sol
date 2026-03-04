contract test {
    mapping(address owner => mapping(address spender => bytes32 note)); //~ ERROR: expected identifier, found `;`
}
