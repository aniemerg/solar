//@ compile-flags: -Ztypeck
contract C {
    using {f} for uint global; //~ ERROR: `global` can only be used at file level
}
function f(uint) pure{}
