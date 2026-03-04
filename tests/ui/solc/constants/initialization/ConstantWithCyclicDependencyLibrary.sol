//@ compile-flags: -Ztypeck
library A {
    uint256 constant VAL = B.VAL + 1; //~ ERROR: member `VAL` not found on type `type(library B)`
}

library B {
    uint256 constant VAL = A.VAL + 1; //~ ERROR: member `VAL` not found on type `type(library A)`
}
