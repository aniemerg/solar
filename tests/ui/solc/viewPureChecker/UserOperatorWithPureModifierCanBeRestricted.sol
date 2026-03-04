//@ compile-flags: -Ztypeck
type Int is uint8;

using {add as +} for Int global;

function add(Int, Int) pure returns (Int) {}

function f() pure {
    Int.wrap(0) + Int.wrap(1); //~ ERROR: cannot apply builtin operator `+` to `Int` and `Int`
}

function g() view {
    Int.wrap(0) + Int.wrap(1); //~ ERROR: cannot apply builtin operator `+` to `Int` and `Int`
}

function h() {
    Int.wrap(0) + Int.wrap(1); //~ ERROR: cannot apply builtin operator `+` to `Int` and `Int`
}
