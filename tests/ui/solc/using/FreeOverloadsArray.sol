//@ compile-flags: -Ztypeck
function f(uint x, uint[] y) pure returns (uint) { //~ ERROR: expected data location
    return x;
}
function f(uint x, uint y) pure returns (int) {
    return x;
}
using {f} for uint;
