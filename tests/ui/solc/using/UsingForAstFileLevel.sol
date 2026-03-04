//@ compile-flags: -Ztypeck
function id(uint x) pure returns (uint) {
    return x;
}

using {id} for *; //~ ERROR: the type has to be specified explicitly at file level (cannot use `*`)
