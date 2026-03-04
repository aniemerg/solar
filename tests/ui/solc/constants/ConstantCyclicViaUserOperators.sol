//@ compile-flags: -Ztypeck
type Type is uint;
using {f as +} for Type global;
function f(Type, Type) pure returns (Type) {}

Type constant t = Type.wrap(1);
Type constant u = v + t; //~ ERROR: cannot apply builtin operator `+` to `Type` and `Type`
Type constant v = u + t; //~ ERROR: cannot apply builtin operator `+` to `Type` and `Type`
