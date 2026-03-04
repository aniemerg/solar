//@ compile-flags: -Ztypeck
using {f} for * global; //~ ERROR: the type has to be specified explicitly at file level (cannot use `*`)
//~^ ERROR: can only globally attach functions to specific types
function f(uint) pure{}
