//@ compile-flags: -Ztypeck
contract C {
    function f(uint y) public pure {
        // one byte too long for storing in Fixedbytes (would require 33 bytes)
        y = 0xffffffff00000000ffffffff00000000ffffffff00000000ffffffff000000001; //~ ERROR: integer part too large
    }
}
