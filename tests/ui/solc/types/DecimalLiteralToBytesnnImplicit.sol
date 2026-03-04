//@ compile-flags: -Ztypeck
contract C {
   function f() public pure {
     bytes1 b1 = 1; //~ ERROR: mismatched types
     bytes2 b2 = 1; //~ ERROR: mismatched types
     bytes2 b3 = 256; //~ ERROR: mismatched types
     bytes3 b4 = 1; //~ ERROR: mismatched types
     bytes3 b5 = 65536; //~ ERROR: mismatched types
     bytes4 b6 = 1; //~ ERROR: mismatched types
     bytes4 b7 = 16777216; //~ ERROR: mismatched types
     bytes16 b8 = 1; //~ ERROR: mismatched types
     bytes32 b9 = 1; //~ ERROR: mismatched types
   }
}
