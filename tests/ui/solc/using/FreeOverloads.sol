//@ compile-flags: -Ztypeck
function f(uint8 x) pure returns (uint) {
    return x;
}
function f(int8 storage x) pure returns (int) { //~ ERROR: data location can only be specified for array, struct or mapping types
    return x[0];
}
using {f} for uint8;
using {f} for int;
