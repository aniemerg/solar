contract C {
  int[0] a; //~ ERROR: array length must be greater than zero
  uint[0] b; //~ ERROR: array length must be greater than zero
  bytes1[0] c; //~ ERROR: array length must be greater than zero
  bytes32[0] d; //~ ERROR: array length must be greater than zero
  bytes[0] e; //~ ERROR: array length must be greater than zero
  string[0] f; //~ ERROR: array length must be greater than zero
}
