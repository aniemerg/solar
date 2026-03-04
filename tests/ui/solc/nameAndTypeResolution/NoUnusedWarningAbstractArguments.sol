//@ compile-flags: -Ztypeck
abstract contract C {
    function f(uint a) pure public virtual returns (uint b);
}
