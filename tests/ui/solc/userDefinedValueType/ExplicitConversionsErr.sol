//@ compile-flags: -Ztypeck
type MyUInt is uint;
type MyAddress is address;
type AnotherUInt is uint;

function f() pure {
    MyUInt(-1); //~ ERROR: invalid explicit type conversion
    MyAddress(-1); //~ ERROR: invalid explicit type conversion
    MyUInt(5); //~ ERROR: invalid explicit type conversion
    MyAddress(address(5)); //~ ERROR: invalid explicit type conversion

    AnotherUInt(MyUInt.wrap(5)); //~ ERROR: invalid explicit type conversion
    MyUInt(AnotherUInt.wrap(10)); //~ ERROR: invalid explicit type conversion
    AnotherUInt.unwrap(MyUInt.wrap(5)); //~ ERROR: mismatched types
    MyUInt.unwrap(AnotherUInt.wrap(10)); //~ ERROR: mismatched types
}
