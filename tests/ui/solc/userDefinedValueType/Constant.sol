//@ compile-flags: -Ztypeck
contract C {
    type MyInt is int;
    MyInt constant mi = MyInt.wrap(5);
    // This is currently unsupported.
    uint[MyInt.unwrap(mi)] arr; //~ ERROR: failed to evaluate constant: unsupported expression
}
