//@compile-flags: -Ztypeck
function f(uint) returns (bytes memory) {}
function f(uint[] memory x) returns (bytes memory) { return f(x[0]); } //~ ERROR: no matching declarations found
function g(uint8) {}
function g(uint16) {}
function t() {
    g(2); //~ ERROR: no matching declarations found
}
