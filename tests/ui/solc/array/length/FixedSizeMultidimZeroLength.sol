contract C {
  function a() public pure returns(int[0][500] memory) {} //~ ERROR: array length must be greater than zero
  function b() public pure returns(uint[0][500] memory) {} //~ ERROR: array length must be greater than zero
  function c() public pure returns(bytes1[0][500] memory) {} //~ ERROR: array length must be greater than zero
  function d() public pure returns(bytes32[0][500] memory) {} //~ ERROR: array length must be greater than zero
  function e() public pure returns(bytes[0][500] memory) {} //~ ERROR: array length must be greater than zero
  function e() public pure returns(string[0][500] memory) {} //~ ERROR: array length must be greater than zero
}
