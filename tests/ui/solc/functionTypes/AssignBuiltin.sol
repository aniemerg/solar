//@ compile-flags: -Ztypeck
contract C {
  function f() public {
     function (uint) view returns (bytes32) _blockhash = blockhash; //~ ERROR: mismatched types
  }
}
