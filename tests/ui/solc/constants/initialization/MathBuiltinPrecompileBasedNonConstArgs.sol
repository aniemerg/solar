//@ compile-flags: -Ztypeck
contract A {
    bytes data = hex"ffff"; //~ ERROR: mismatched types
    bytes32 constant sha = sha256(data);
    bytes20 constant ripemd = ripemd160(data);
    address constant addr = ecrecover("1234", 1, "0", abi.decode(data, (bytes2))); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: mismatched types
}
