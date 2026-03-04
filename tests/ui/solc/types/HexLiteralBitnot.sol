//@ compile-flags: -Ztypeck
contract C {
    bytes32 b = ~hex"00ff11"; //~ ERROR: cannot apply unary operator `~` to `bytes_string_literal[3]`
}
