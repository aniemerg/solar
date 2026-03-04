//@ compile-flags: -Ztypeck
contract c {
    function f(uint a) public { uint8[a] x; } //~ ERROR: failed to evaluate constant: only constant variables are allowed
}
