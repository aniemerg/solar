//@ compile-flags: -Ztypeck
function f(MyIntB x) pure {}
type MyIntB is MyIntB; //~ ERROR: the underlying type of UDVTs must be an elementary value type
