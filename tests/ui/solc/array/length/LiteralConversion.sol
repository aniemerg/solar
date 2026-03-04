contract C {
    uint[uint(1)] valid_size_invalid_expr1; //~ ERROR: failed to evaluate constant: unsupported expression
    uint[uint(2**256-1)] valid_size_invalid_expr2; //~ ERROR: failed to evaluate constant: unsupported expression
    uint[uint(2**256)] invalid_size_invalid_expr3; //~ ERROR: failed to evaluate constant: unsupported expression

    uint[int(1)] valid_size_invalid_expr4; //~ ERROR: failed to evaluate constant: unsupported expression
    uint[int(2**256-1)] valid_size_invalid_expr5; //~ ERROR: failed to evaluate constant: unsupported expression
    uint[int(2**256)] invalid_size_invalid_expr6; //~ ERROR: failed to evaluate constant: unsupported expression
}
