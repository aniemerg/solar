//@ compile-flags: -Ztypeck
using L for * global; //~ ERROR: the type has to be specified explicitly at file level (cannot use `*`)
//~^ ERROR: can only globally attach functions to specific types
library L {}
