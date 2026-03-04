//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        uint8 a = 256; //~ ERROR: mismatched types
        uint8 b = uint8(256); //~ ERROR: invalid explicit type conversion
        int8 c = int8(-129);
    }
}
