//@ compile-flags: -Ztypeck
contract test {
string uintM = "Hello 4 you"; //~ ERROR: mismatched types
    function f() public {
        uint8 uint7 = 3;
        uint7 = 5;
        string memory intM;
        uint bytesM = 21;
        intM; bytesM;
    }
}
