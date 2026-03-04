//@ compile-flags: -Ztypeck
using {f} for S global global; //~ ERROR: expected `;`, found `global`
struct S { uint x; }
function f(S memory _x) pure returns (uint) { return _x.x; }
