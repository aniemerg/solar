//@ compile-flags: -Ztypeck
type T is uint;
library L {
  function f(mapping(T=>T) memory) public {} //~ ERROR: type `mapping(T => T)` is only valid in storage because it contains a (nested) mapping
}
