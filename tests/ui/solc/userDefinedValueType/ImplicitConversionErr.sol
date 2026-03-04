//@ compile-flags: -Ztypeck
type MyInt is int;
function f(int a) pure returns (int) {
    MyInt b = a; //~ ERROR: mismatched types

    int c = b; //~ ERROR: mismatched types

    address d = b; //~ ERROR: mismatched types

    MyInt e = d; //~ ERROR: mismatched types

    uint x = 0;
    MyInt y = MyInt(x); //~ ERROR: invalid explicit type conversion

    return e;
}
