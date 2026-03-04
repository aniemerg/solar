//@ compile-flags: -Ztypeck
pragma abicoder               v2;
contract C {
   function f1() public pure returns (bytes memory) {
       return abi.encodePacked(0.1, 1); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: rational literals are not supported
   }
}
