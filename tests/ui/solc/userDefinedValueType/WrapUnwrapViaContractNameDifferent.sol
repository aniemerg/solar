//@ compile-flags: -Ztypeck
contract C { type T is uint; }
library L { type T is uint; }
contract D
{
    C.T x = L.T.wrap(uint(1)); //~ ERROR: member `T` not found on type `type(library L)`
}
