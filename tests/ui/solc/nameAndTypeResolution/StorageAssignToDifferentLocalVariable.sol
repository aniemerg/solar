//@ compile-flags: -Ztypeck
contract C {
    uint[] data;
    uint8[] otherData;
    function f() public {
        uint8[] storage x = otherData;
        uint[] storage y = data;
        y = x; //~ ERROR: mismatched types
        // note that data = otherData works
    }
}
