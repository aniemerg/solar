//@compile-flags: -Ztypeck
type Int is int256;

function f() pure {
    Int a = Int.wrap(0);
    -a; //~ ERROR: cannot apply unary operator `-` to `Int`
    a++; //~ ERROR: cannot apply unary operator `++` to `Int`
}
