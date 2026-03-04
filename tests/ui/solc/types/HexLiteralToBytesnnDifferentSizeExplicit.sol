//@ compile-flags: -Ztypeck
contract C {
   function f() public pure {
     bytes1 b1 = bytes1(0x1); //~ ERROR: invalid explicit type conversion
     bytes1 b2 = bytes1(0x100); //~ ERROR: invalid explicit type conversion
     bytes2 b3 = bytes2(0xFF); //~ ERROR: invalid explicit type conversion
     bytes2 b4 = bytes2(0x100); //~ ERROR: invalid explicit type conversion
     bytes2 b5 = bytes2(0x10000); //~ ERROR: invalid explicit type conversion
     bytes3 b6 = bytes3(0xFFFF); //~ ERROR: invalid explicit type conversion
     bytes3 b7 = bytes3(0x10000); //~ ERROR: invalid explicit type conversion
     bytes3 b8 = bytes3(0x1000000); //~ ERROR: invalid explicit type conversion
     bytes4 b9 = bytes4(0xFFFFFF); //~ ERROR: invalid explicit type conversion
     bytes4 b10 = bytes4(0x1000000); //~ ERROR: invalid explicit type conversion
     bytes4 b11 = bytes4(0x100000000); //~ ERROR: invalid explicit type conversion
     bytes16 b12 = bytes16(0x1); //~ ERROR: invalid explicit type conversion
     bytes32 b13 = bytes32(0x1); //~ ERROR: invalid explicit type conversion
   }
}
