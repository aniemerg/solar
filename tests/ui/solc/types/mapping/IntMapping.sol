//@ compile-flags: -Ztypeck
library L {
  function f(mapping(uint=>uint) memory) public {} //~ ERROR: type `mapping(uint256 => uint256)` is only valid in storage because it contains a (nested) mapping
}
