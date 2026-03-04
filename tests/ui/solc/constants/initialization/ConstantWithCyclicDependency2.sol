//@ compile-flags: -Ztypeck
contract C {
    uint constant a = b * c;
    uint constant b = 7;
    uint constant c = b + uint(keccak256(abi.encodePacked(d))); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
//~^ ERROR: invalid explicit type conversion
    uint constant d = 2 + a;
}
