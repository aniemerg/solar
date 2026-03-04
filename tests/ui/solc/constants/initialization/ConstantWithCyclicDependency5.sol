//@ compile-flags: -Ztypeck
contract C {
  uint constant a = uint(keccak256(abi.encode(d))); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
//~^ ERROR: invalid explicit type conversion
  uint c = uint(keccak256(abi.encode(d))); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
//~^ ERROR: invalid explicit type conversion
  uint constant d = a;
}
