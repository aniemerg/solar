//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        address payable a = payable(uint160(0)); //~ ERROR: invalid explicit type conversion
        address payable b = payable(bytes20(0)); //~ ERROR: invalid explicit type conversion
        address payable c = payable(2); //~ ERROR: invalid explicit type conversion
        // hex literal that is only 15 bytes long
        address payable d = payable(0x002190356cBB839Cbe05303d7705Fa); //~ ERROR: invalid explicit type conversion

        // The opposite should also be disallowed
        uint160 a1 = uint160(payable(0)); //~ ERROR: invalid explicit type conversion
        bytes20 b1 = bytes20(payable(0)); //~ ERROR: invalid explicit type conversion
    }
}
