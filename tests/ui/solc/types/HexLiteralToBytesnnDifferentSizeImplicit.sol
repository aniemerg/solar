//@ compile-flags: -Ztypeck
contract C {
   function f() public pure {
     bytes1 b1 = 0x1; //~ ERROR: mismatched types
     bytes1 b2 = 0x100; //~ ERROR: mismatched types
     bytes2 b3 = 0xFF; //~ ERROR: mismatched types
     bytes2 b4 = 0x100; //~ ERROR: mismatched types
     bytes2 b5 = 0x10000; //~ ERROR: mismatched types
     bytes3 b6 = 0xFFFF; //~ ERROR: mismatched types
     bytes3 b7 = 0x10000; //~ ERROR: mismatched types
     bytes3 b8 = 0x1000000; //~ ERROR: mismatched types
     bytes4 b9 = 0xFFFFFF; //~ ERROR: mismatched types
     bytes4 b10 = 0x1000000; //~ ERROR: mismatched types
     bytes4 b11 = 0x100000000; //~ ERROR: mismatched types
     bytes16 b12 = 0x1; //~ ERROR: mismatched types
     bytes32 b13 = 0x1; //~ ERROR: mismatched types
   }
}
