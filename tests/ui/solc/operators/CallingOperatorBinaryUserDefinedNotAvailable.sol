//@compile-flags: -Ztypeck
type Int is int256;

function f() pure {
    Int a = Int.wrap(0);
    a + a; //~ ERROR: cannot apply builtin operator `+` to `Int` and `Int`
    a >>> a; //~ ERROR: cannot apply builtin operator `>>>` to `Int` and `Int`
}
