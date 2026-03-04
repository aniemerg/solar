//@ compile-flags: -Ztypeck
contract c {
    function f(uint a) public { uint8[-1] x; } //~ ERROR: expected data location
}
