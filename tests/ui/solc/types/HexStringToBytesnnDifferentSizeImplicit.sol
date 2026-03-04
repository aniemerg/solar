//@ compile-flags: -Ztypeck
contract C {
   function f() public pure {
     bytes1 b1 = hex""; //~ ERROR: mismatched types
     bytes1 b2 = hex"1234"; //~ ERROR: mismatched types
     bytes2 b3 = hex"12";
     bytes2 b4 = hex"1234";
     bytes2 b5 = hex"123456"; //~ ERROR: mismatched types
     bytes3 b6 = hex"1234";
     bytes3 b7 = hex"123456";
     bytes3 b8 = hex"12345678"; //~ ERROR: mismatched types
     bytes4 b9 = hex"123456";
     bytes4 b10 = hex"12345678";
     bytes4 b11 = hex"1234567890"; //~ ERROR: mismatched types
   }
}
