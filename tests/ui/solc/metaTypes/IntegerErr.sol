//@ compile-flags: -Ztypeck
contract Test {
    function assignment() public {
        uint8 uint8Min = type(int).min; //~ ERROR: mismatched types
        uint uintMin = type(int).min; //~ ERROR: mismatched types

        if (type(int).min == 2**256 - 1) { //~ ERROR: cannot apply builtin operator `==` to `int256` and `uint8`
            uintMin;
        }

    }
}
