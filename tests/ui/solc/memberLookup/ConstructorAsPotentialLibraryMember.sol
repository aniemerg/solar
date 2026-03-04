//@ compile-flags: -Ztypeck
library L{ constructor() { L.x; } } //~ ERROR: member `x` not found on type `type(library L)`
