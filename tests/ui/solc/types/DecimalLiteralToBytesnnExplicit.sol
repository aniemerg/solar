//@ compile-flags: -Ztypeck
contract C {
   function f() public pure {
     bytes1 b1 = bytes1(1); //~ ERROR: invalid explicit type conversion
     bytes2 b2 = bytes2(1); //~ ERROR: invalid explicit type conversion
     bytes2 b3 = bytes2(256); //~ ERROR: invalid explicit type conversion
     bytes3 b4 = bytes3(1); //~ ERROR: invalid explicit type conversion
     bytes3 b5 = bytes3(65536); //~ ERROR: invalid explicit type conversion
     bytes4 b6 = bytes4(1); //~ ERROR: invalid explicit type conversion
     bytes4 b7 = bytes4(16777216); //~ ERROR: invalid explicit type conversion
     bytes16 b8 = bytes16(1); //~ ERROR: invalid explicit type conversion
     bytes32 b9 = bytes32(1); //~ ERROR: invalid explicit type conversion
   }
}
